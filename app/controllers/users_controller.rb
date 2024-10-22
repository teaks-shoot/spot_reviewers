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
  end
  
  
  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:infomation)
  end
  
end
