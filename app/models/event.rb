class Event < ApplicationRecord
	belongs_to :detector

	acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude

	scope :since, ->(ts){where(["detected_at >= ?", since])}
	scope :until, ->(ts){where(["detected_at <= ?", since])}
end
