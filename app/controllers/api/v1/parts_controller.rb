class API::V1::PartsController < API::V1::BaseController
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  before_action :set_part, only: [:show]
  before_action :set_category, only: [:category]

  # GET /parts/:id
  def show
    respond_with(@part, :only => [:name, :description, :number, :qty, :picture, :year])
  end

  def category
    respond_with(@parts, :only => [:id, :name, :description, :number, :qty, :picture, :year])
  end

  private
    def set_part
      @part = Part.find(params[:id])
    end

    def set_category
      @parts = Part.where(:category => params[:id])
      render :status=>404, :json=>{:error=>"Category does not exist,"} if @parts.blank?
    end

    def record_not_found
      render :status=>404, :json=>{:error=>"Part does not exist."}
    end
end
