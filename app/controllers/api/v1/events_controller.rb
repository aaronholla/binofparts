class API::V1::EventsController < API::V1::ApplicationController
  respond_to :json
  
  before_action :set_event, only: [:show]

  # GET /events
  def index
    respond_with(Event.all, :only => [:id, :key, :name, :short_name, :start_date, :end_date, :official])
  end

  # GET /events/1
  def show
    respond_with(@event, :only => [:id, :key, :name, :short_name, :start_date, :end_date, :official])
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

end