class EventsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:destroy]

    before_action :authenticate_user!
    load_and_authorize_resource

        
    def index
      
    end

    def show

        @event = Event.find(params[:id])
        
    end
    def new
        @event = Event.new
    end
    def create
        
        @event = current_user.events.new(event_params)
        if @event.save!
          redirect_to events_path, notice: 'Event was successfully created.'
        else
          render :new
        end
    end
    def edit
        @event = Event.find(params[:id])
    end
    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
          redirect_to @event, notice: 'Event was successfully updated.'
        else
          render :edit
        end
      end
    
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path, status: :see_other
  end

  def show_events
    @events = Event.all
  end


    
      

      
    private

    def event_params
      params.require(:event).permit(:name, :date, :location) # Adjusted to match your Event model attributes
    end
end
