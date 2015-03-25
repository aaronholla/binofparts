class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.order('team_number asc').paginate(:page => params[:page], :per_page => 600)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @events = []
    @team.events.each do |event|
       @events << Event.find_by_key(event)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find_by_team_number(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params[:team]
    end
end
