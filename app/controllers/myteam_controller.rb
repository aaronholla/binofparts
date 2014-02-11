class MyteamController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_myteam

  # GET /myteams
  def index
    @myteam = User.where(:team_number_id => current_user.team_number_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_myteam
      @myteamnumber = current_user.team_number_id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def myteam_params
      params[:myteam]
    end
end
