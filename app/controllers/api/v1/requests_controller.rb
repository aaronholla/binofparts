class API::V1::RequestsController < API::V1::ApplicationController
  respond_to :json
  
  before_action :set_request, only: [:edit, :update, :destroy]
  before_action :set_event, only: [:index, :team, :create]

  # GET /requests
  def index
    respond_with(@event.requests.where('team_id != ?',params[:team]).order("updated_at DESC"),:except => [:part_id],:include => {
          :part => {:only => [:name, :description, :picture, :year]}
        })
  end

  def update_feed
    time_ago = Time.now - 15.seconds
    respond_with(@event.requests.where("updated_at > ? AND team_id != ?", time_ago, params[:team]).order("updated_at DESC"),:except => [:part_id],:include => {
          :part => {:only => [:name, :description, :picture, :year]}
        })
  end

  # GET /requests/1
  def team
    respond_with(@event.requests.where(:team_id => params[:id]).order("updated_at DESC"),:except => [:part_id],:include => {
          :part => {:only => [:name, :description, :picture, :year]}
        })
  end

  # POST /requests
  def create 
    @event.requests.create(:part_id=> params[:part_id], :qty=> params[:qty], :event_id=> params[:event_id], :team_id=> params[:team_id])
    render :status=>200, :json=>{:message=>"Success"}
  end

  # POST /requests/1/accept
  def accept
    @request = Request.find(params[:id])
    if @request.accepted
      render :status=>400,
              :json=>{:message=>"Already Accepted."}
    else
      @request.accepted = true
      @request.accepted_by = current_user.team_number_id
      @request.accepted_at = Time.now
      @request.save
      render :status=>200, :json=>{:message=>"Success"}
    end
  end

  # PATCH/PUT /requests/1
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1
  def destroy
    @event = Event.find(params[:event_id])
    @request = @event.requests.find(params[:id])
    @request.destroy
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

    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find_by_id(params[:id])
      if @request.nil?
        render :status=>404, :json=>{:error=>"Request does not exist."}
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:part_id, :qty, :event_id, :team_id)
    end  
  
end
