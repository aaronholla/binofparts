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
    @event.requests.create(:accepted => true,:accepted_at=>Time.now, :accepted_by => current_user.team_number_id, :part_id=> params[:part_id], :qty=> params[:qty], :event_id=> params[:event_id], :team_id=> params[:team_id])
    @inventory = @event.inventories.find(params[:id]) 
    @inventory.qty = @inventory.qty - params[:qty]
    @inventory.save
    render :status=>200, :json=>{:message=>"Success"}
  end

  # POST /requests
  def create 
    @event.inventories.create(:part_id=> params[:part_id], :qty=> params[:qty], :event_id=> params[:event_id])
    render :status=>200, :json=>{:message=>"Success"}
  end

  # DELETE /requests/1
  def destroy
    @event = Event.find(params[:event_id])
    @inventory = @event.inventories.find(params[:id])
    @inventory.destroy
    redirect_to event_path(@event)
    # respond_to do |format|
    #   format.html { redirect_to requests_url }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_event
      @event = Event.find_by_key(params[:event_id])
      if @event.nil?
        render :status=>404, :json=>{:error=>"Event does not exist."}
      end
    end
  
end
