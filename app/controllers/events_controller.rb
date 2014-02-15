class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  helper_method :sort_column, :sort_direction

  # GET /events
  # GET /events.json
  def index
    @events = Event.order(sort_column + " " + sort_direction)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @requests = @event.requests.first(10)
    @request = Request.new
    @request.event_id = @event.id
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params[:event]
    end
    def sort_column
      Event.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
