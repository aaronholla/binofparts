class API::V1::PartsController < API::V1::BaseController
  respond_to :json

  def category
  	respond_with(Part.where(:category => params[:id]))
  end
end