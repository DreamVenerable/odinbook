class FellowshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  before_action :find_fellowship

  def index
    @following = @user.followees
    @followers = @user.followers
  end

  def create
    if following?
      delete
    else
      @fellowship = current_user.followed_users.create(followee_id: @user.id)
    end

    redirect_to request.referrer
  end

  # def update
  #   if @fellowship.update(status: 'accepted')
  #     flash[:notice] = "Friend request accepted."
  #   else
  #     flash[:alert] = "Failed to accept friend request."
  #   end

  #   redirect_to request.referrer
  # end

  def delete
    @fellowship.destroy
  end

  private

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_fellowship
    @fellowship = Fellowship.where(follower_id: current_user.id, followee_id: @user.id).first
  end

  def following?
    find_fellowship.present?
  end
end
