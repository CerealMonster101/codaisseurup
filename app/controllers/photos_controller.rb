class PhotosController < ApplicationController
  def destroy
    photo = Photo.find(params[:id])
    @event = photo.event
    if @event.user.id == current_user.id
      photo.destroy

      redirect_to edit_room_path(@event), notice: "Photo sucessfully removed"
    else
      redirect_to @event, notice: "Cannot delete that photo"
    end
  end
end
