class API::V1::TeamsController < API::V1::BaseController
  respond_to :json
  
  before_action :set_team, only: [:show]

  # GET /teams
  def index
    respond_with(Team.all, :only => [:team_number, :nickname, :name, :key, :website, :locality, :region, :country_name, :location, :events])
  end

  # GET /teams/1
  def show
    respond_with(@team, :only => [:team_number, :nickname, :name, :key, :website, :locality, :region, :country_name, :location, :events])
  end

  private
    def set_team
      @team = Team.find_by_team_number(params[:id])
    end

end