class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = User.find(params[:id])
  end

  def user_posts
    @user = User.find(params[:id])
  end
end
