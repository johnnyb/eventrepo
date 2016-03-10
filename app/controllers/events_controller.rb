class EventsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		@detector = Detector.for_identity(params[:serial_number], params[:token]).first
		@event = @detector.events.create!(params.require(:event).permit(:detected_at, :event_data_base64, :latitude, :longitude, :event_type))
		if @event.latitude.blank?
			@event.latitude = @detector.latitude
			@event.longitude = @detector.longitude
		end
		render :json => @event.to_json, :status => :created
	end

	def index
		if params[:serial_number].present?
			@detector = Detector.for_identity(params[:serial_number], params[:token])
		end
		scope = @detector.present? ? @detector.events : Event
		if params[:since]
			scope = scope.since(params[:since])
		end

		if params[:until]
			scope = scope.until(params[:until])
		end

		render :json => scope.to_a.to_json
	end

	def show
		@event = Event.find(params[:id])
		render :json => @event.to_json
	end
end
