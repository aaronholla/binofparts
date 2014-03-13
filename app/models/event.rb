class Event < ActiveRecord::Base
	has_many :requests
	has_many :inventories

	def to_param
	  key
	end
end
