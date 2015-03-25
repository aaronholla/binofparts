class EventsController < ApplicationController
  before_action :set_team_events
  before_action :set_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.order('start_date asc')

    if user_signed_in? && current_user.team_number_id.presence
      @your_events = []
      @team_events.each do |event|
          @your_events << Event.find_by_key(event)
      end

      @your_events.sort!{|a,b|a.start_date <=> b.start_date}
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @requests = @event.requests.order('updated_at DESC')
  end

  def set_cat
    @event = Event.find_by_key(params[:event])
    @category = params[:category].downcase
    @parts = Part.where(:category => @category)
    respond_to do |format|
      format.js {render 'set_category.js.erb'}
    end
  end

  def set_part
    @event = Event.find_by_key(params[:event])
    @part_id = params[:part]
    @part = Part.find(@part_id)
    respond_to do |format|
      format.js {render 'set_part.js.erb'}
    end
  end

  private
    # Get all events for the current users team
    def set_team_events
      if user_signed_in? && current_user.team_number_id.presence
        @team_events = Team.find_by_team_number(current_user.team_number_id).events
      end
    end
end
