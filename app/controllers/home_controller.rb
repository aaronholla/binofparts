class HomeController < ApplicationController
	before_action :set_team, only: [:index]
	def index
	    @events = []
	    @team.events.each do |event|
	    	@requests = Event.find_by_key(event).requests
	       	@events << Event.find_by_key(event)
	    end

	    @myteam = User.where(:team_number_id => current_user.team_number_id)
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find_by_team_number(current_user.team_number_id)
    end

end
