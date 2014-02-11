class MyteamController < ApplicationController
  before_filter :authenticate_user!

  # GET /myteams
  def index
    @myteam = User.where(:team_number_id => current_user.team_number_id)
  end
end
