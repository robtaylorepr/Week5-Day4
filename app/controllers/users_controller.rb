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
    if current_user
      @other_uname = params[:uname]
      @other_user  = User.find_by(uname: @other_uname)
      if other_user
        current_user.toggle_follow!(@other_user)
        render json: ["toggled follow status of #{other_uname}"]
      else
        render json: ["no user #{@other_uname}"], status: 400
      end
    else
      render json: ["must logged in to follow/unfollow"], status: 400
    end
  end

  private

  def user_params
    params.permit(:name, :uname, :photo, :password)
  end

end
