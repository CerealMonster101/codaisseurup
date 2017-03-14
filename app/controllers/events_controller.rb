class EventsController < ApplicationController

  def index
      @events = current_user.events
    end

    def show
    end

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

end
