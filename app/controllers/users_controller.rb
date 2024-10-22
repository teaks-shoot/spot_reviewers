class UsersController < ApplicationController
  def mypage
    @user = current_user
    @reviews = @user.reviews
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def edit
  end

  def unsubscribe
  end
end
