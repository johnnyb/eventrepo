class Detector < ApplicationRecord
	has_many :events

	acts_as_mappable :lat_column_name => :latitude, :lng_column_name => :longitude

	scope :for_identity, ->(sn, tk){where(:serial_number => sn, :token => tk)}

	before_save :generate_token

	def generate_token
		self.token = SecureRandom.base58(16)
	end
end
