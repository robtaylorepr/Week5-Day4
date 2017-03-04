class PostsController < ApplicationController
  before_action :require_user, only: [:create]

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    if current_user
      binding.pry
      @post.user = current_user
      if @post.save
        render json: @post
      else
        render json: @post.errors.full_messages, status: 400
      end
    else
      require_user
    end
  end

  private

  def post_params
    params.permit(:body)
  end

end
