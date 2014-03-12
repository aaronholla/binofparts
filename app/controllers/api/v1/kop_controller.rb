class API::V1::KopController < API::V1::BaseController
  respond_to :json
  
  before_action :set_year, only: [:show]

  # GET /parts/2014
  def show
    respond_with(@parts, :only => [:name, :description, :number, :qty, :picture, :year])
  end

  private
    def set_year
      @parts = Part.where(:year => params[:id])
    end

end