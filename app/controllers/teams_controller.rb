class TeamsController < ApplicationController
  before_action :set_team, only: [:show]
  helper_method :sort_column, :sort_direction

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.order(sort_column + " " + sort_direction)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params[:team]
    end

    def sort_column
      Team.column_names.include?(params[:sort]) ? params[:sort] : "team_number"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
