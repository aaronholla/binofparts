class Team < ActiveRecord::Base
	has_many :users

	def to_param
	  team_number
	end
end
