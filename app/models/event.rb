class Event < ActiveRecord::Base
	has_many :requests

	def to_param
	  key
	end
end
