class RegistrationsController < ApplicationController
before_action :authenticate_user!

  def create
    @registrations = current_user.registrations.create(registration_params.merge(room_id: params[:room_id]))
    @registration.set_to_total_price
    @registration.save

    redirect_to_@registration.event, notice: "Thank you for registering!"
  end

  private

  def registration_params
    params.require(:registration).permit(:starts_at, :ends_at)
  end
end
