class Public::UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update, :destroy]
  
  def mypage
    @user = current_user
    @reviews = @user.reviews
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end
  
  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "退会処理が完了しました。"
    redirect_to new_user_registration_path
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:infomation)
  end
  
  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to mypage_path
    end
  end
  
end
