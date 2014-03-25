class API::V1::InventoriesController < API::V1::ApplicationController
  respond_to :json
  
  before_action :set_event, only: [:index, :new, :team, :create]

  # GET /requests
  def index
    respond_with(@event.inventories.all,:except => [:part_id],:include => {
          :part => {:only => [:id, :name, :description, :picture, :year]}
        })
  end

  def new
    @inventory = @event.inventories.find(params[:inventory_id]) 
    if @inventory.qty != 0 
      @event.requests.create(:accepted => true,:accepted_at=>Time.now, :accepted_by => current_user.team_number_id, :part_id=> params[:part_id], :qty=> params[:qty], :event_id=> params[:event_id], :team_id=> params[:team_id])
      @inventory.qty = @inventory.qty - params[:qty].to_f
      @inventory.save
      render :status=>200, :json=>{:message=>"Success"}
    else
    render :status=>200, :json=>{:message=>"Nothing added."}
    end
  end

  # POST /requests
  def create 
    @event.inventories.create(:part_id=> params[:part_id], :qty=> params[:qty], :event_id=> params[:event_id])
    render :status=>200, :json=>{:message=>"Success"}
  end

  # DELETE /requests/1
  def destroy
    @event = Event.find_by_key(params[:event_id])
    @inventory = @event.inventories.find(params[:id])
    @inventory.destroy
    render :status=>200, :json=>{:message=>"Success"}
  end

  private
    def set_event
      @event = Event.find_by_key(params[:event_id])
      if @event.nil?
        render :status=>404, :json=>{:error=>"Event does not exist."}
      end
    end
  
end
