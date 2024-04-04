class TicketsController < ApplicationController
    before_action :set_event
    before_action :authenticate_user!
  
    # GET /events/:event_id/tickets/new
    def new
      @ticket = @event.tickets.new
    end
  
    # POST /events/:event_id/tickets
    def create
      @ticket = @event.tickets.new(ticket_params)
  
      if @ticket.save
        redirect_to @event, notice: 'Ticket was successfully created.'
      else
        render :new
      end
    end
    
    def index
      @event = Event.find(params[:event_id])
      @tickets = @event.tickets
    end

  
    private
  
    def set_event
      @event = Event.find(params[:event_id])
    end
  
    def ticket_params
      params.require(:ticket).permit(:price, :status)
    end
  end
  