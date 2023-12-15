class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_like

  def create
    if already_liked?
      destroy
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to request.referrer
  end

  def destroy
    @like.destroy
  end

  private

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_like
    @like = @post.likes.where(user_id: current_user.id).first
  end
end
