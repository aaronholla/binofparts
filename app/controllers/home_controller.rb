class HomeController < ApplicationController
	before_action :set_team, only: [:index]
	def index
	    @event_ids = []
	    @events = []
	    @team.events.each_with_index do |event, index|
	       	@events << Event.find_by_key(event)
	       	@event_ids << @events[index].id
	    end

	    @requests = Request.where(:event_id => @event_ids).order("updated_at DESC")

	    @events.sort!{|a,b|a.start_date <=> b.start_date}
	    @myteam = User.where(:team_number_id => current_user.team_number_id)
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find_by_team_number(current_user.team_number_id)
    end

end
