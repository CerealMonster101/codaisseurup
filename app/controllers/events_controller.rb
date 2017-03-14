class EventsController < ApplicationController

before_action :set_event, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]

  #fetching all events for current user
  def index
      @events = current_user.events
    end

    def show
    end

    #building new event for current user using build method
    def new
      @event = current_user.events.build
    end

    def create
      @event = current_user.events.build(room_params)

      if @event.save
        redirect_to @event, notice: "Event successfully created"
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @event.update(room_params)
        redirect_to @event, notice: "Event successfully updated"
      else
        render :edit
      end
    end

    private
    def set_event
      @event = Event.find(params[:id])
    end

end
