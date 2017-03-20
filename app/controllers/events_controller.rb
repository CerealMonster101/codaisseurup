class EventsController < ApplicationController

before_action :set_event, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]

  #fetching all events for current user
  def show
    @categories = @event.categories
    @photos = @event.photos
  end


  def index
      @events = current_user.events
    end



    #building new event for current user using build method
    def new
      @event = current_user.events.build
    end

    def create
      @event = current_user.events.build(event_params)

      if @event.save
        image_params_each do |image|
          @event.photos.create(image: image)
        end

        redirect_to edit_event_path(@event), notice: "Event successfully created"
      else
        render :new
      end
    end


    def update
      if @event.update(event_params)
        redirect_to @event, notice: "Event successfully updated"
      else
        render :edit
      end
    end

    def edit
      if current_user.id == @event.user.id
        @photos = @event.photos
      else
        redirect_to root_path, notice: "You don't have permission."
      end
    end

    private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:name, :description, :location, :includes_food, :includes_drinks, :price, :starts_at, :ends_at, :capacity, :active, category_ids: [])
    end

    def image_params
      params[:images].present? ? params.require(:images) : []
    end

end
