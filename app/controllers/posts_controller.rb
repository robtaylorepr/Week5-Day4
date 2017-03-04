class PostsController < ApplicationController
  before_action :require_user, only: [:create]

  def index
    if current_user
      @posts = Post.timeline(current_user)
    else
      @posts = Post.all
    end
    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  private

  def post_params
    params.permit(:body)
  end

end
