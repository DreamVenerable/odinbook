class FellowshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def index
    @following = @user.followees
    @followers = @user.followers
  end

  def create
    @fellowship = current_user.followed_users.create(followee_id: @user.id)

    redirect_to request.referrer
  end

  def destroy
    @fellowship = Fellowship.find(params[:id])
    @fellowship.destroy

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

  private

  def find_user
    @user = User.find(params[:user_id] || params[:id])
  end
end
