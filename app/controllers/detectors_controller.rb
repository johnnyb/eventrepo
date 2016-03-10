class DetectorsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def create
		@detector = Detector.create!(params.require(:detector).permit(:name, :serial_number, :owner, :latitude, :longitude))
		render :json => @detector.to_json, :status => :created
	end

	def show
		@detector = Detector.find(params[:id])
		render :json => @detector.to_json
	end

	def index
		render :json => Detector.all.to_a.to_json
	end

	def destroy
		@detector = Detector.for_identity(params[:serial_number], params[:token]).first.destroy
	end
end
