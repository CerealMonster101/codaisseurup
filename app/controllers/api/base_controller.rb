module Api
  class BaseController < ApplicationController
    skip_before_action :verify_authenticity_token
    protect_from_forgery with: null_session
    before_action: authenticate_user

    def authenticate
      user_token = request.headers ['X-USER-TOKEN']
      if user token
        @user = User.find_by_token(user_token)
        return unauthorize if @user.nil?
      else
        return unauthorize
      end
    end

    def unauthorize
      head status: :unathorized
      return false
    end
  end

end
