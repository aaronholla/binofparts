class RequestsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_request, only: [:show, :edit, :update, :destroy]
  before_action :set_event, only: [:index, :create, :accept]

  # GET /requests
  # GET /requests.json
  def index
    redirect_to event_path(@event)
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
    unless current_user.team_number_id == @request.team_id
        redirect_to event_requests_path, notice: "You cannot edit this request."
    end 
  end

  # POST /requests
  # POST /requests.json
  def create
    
    @request = @event.requests.create(request_params)
    @request.team_id = current_user.team_number_id
    redirect_to event_path(@event)

    # respond_to do |format|
    #   if @request.save
    #     format.html { redirect_to @request, notice: 'Request was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @request }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @request.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # GET /requests/1/accept
  def accept
    @request = Request.find(params[:id])
    if @request.accepted
      redirect_to event_request_path(:event_id => params[:event_id], :id => params[:id]), notice: 'Sorry, Request was already accepted.'
    else
      @request.accepted = true
      @request.accepted_by = current_user.team_number_id
      @request.accepted_at = Time.now
      @request.save
      redirect_to event_request_path(:id => @request.id)
    end
  end

  # PATCH/PUT /requests/1
  # PATCH/PUT /requests/1.json
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
  # DELETE /requests/1.json
  def destroy
    @event = Event.find(params[:event_id])
    @request = @event.requests.find(params[:id])
    if @request.team_id != current_user.team_number_id && @request.accepted == false
      redirect_to event_path(@event)
    else
      @request.destroy
      redirect_to event_path(@event)
    end
    
    # respond_to do |format|
    #   format.html { redirect_to requests_url }
    #   format.json { head :no_content }
    # end
  end

  private
    def set_event
      @event = Event.find_by_key(params[:event_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def request_params
      params.require(:request).permit(:part_id, :qty, :event_id, :team_id)
    end
end
