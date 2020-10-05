class PostsController < ApplicationController
  before_action :set_post, only: %i[upvote downvote]

  def index
    @posts = Post.order(rate: :desc, up: :desc)
    render json: @posts, status: :ok
  end

  def upvote
    @post.update(up: @post.up + 1)
  end

  def downvote
    @post.update(down: @post.down + 1)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
