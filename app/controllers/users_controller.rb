class UsersController < ApplicationController
  # skip_before_action:  :require_user, only: [:create, :index]

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: @user.errors.full_messages, status: 400
    end
  end

  def signin
    @user = User.find_by(uname: params[:uname])&.authenticate(params[:password])
    if @user
      render json: @user, serializer: UserExpandedSerializer
    else
      render json: ["User not found"]
    end
  end

  def toggle
    current_user.toggle_follow!(User.find(id: params[:id]))
  end

  private

  def user_params
    params.permit(:name, :uname, :photo, :password)
  end

end
