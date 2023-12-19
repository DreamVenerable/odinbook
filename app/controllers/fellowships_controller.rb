class FellowshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def index
    @following = @user.followees
    @followers = @user.followers
    @requests = @user.following_users.where(status: 'onhold')
    @requesting_users = User.where(id: @requests.pluck(:follower_id))
  end

  def create
    if @user[:private]
      @fellowship = current_user.followed_users.create(followee_id: @user.id, status: 'onhold')
    else
      @fellowship = current_user.followed_users.create(followee_id: @user.id)
    end

    redirect_to request.referrer
  end

  def destroy
    @fellowship = Fellowship.find(params[:id])
    @fellowship.destroy

    redirect_to request.referrer
  end

  def update
    @fellowship = Fellowship.find(params[:id])
    @fellowship.update(status: 'accepted')

    redirect_to request.referrer
  end

  private

  def find_user
    @user = User.find(params[:user_id] || params[:id])
  end
end
