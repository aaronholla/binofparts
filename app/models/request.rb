class Request < ActiveRecord::Base
	belongs_to :team, :primary_key => 'team_number'
	belongs_to :event
	belongs_to :part
end
