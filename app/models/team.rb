class Team < ActiveRecord::Base
	has_many :users
	has_many :requests

	serialize :events

	def to_param
	  team_number
	end
end
