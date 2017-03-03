class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception

  private

     def current_user
       @current_user ||= User.find_by(api_token: params[:api_token]) if params[:api_token]
     end

     def require_user
       render json: {error: "You must be logged in"}, status: 401 unless current_user
     end

     def forbid_user
       render json: {error: "You're already logged in"}, status: 401 if current_user
     end


end
