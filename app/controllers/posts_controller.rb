class PostsController < ApplicationController

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 400
    end
  end

  private

  def post_params
    params.permit(:body, :api_token)
  end

end
