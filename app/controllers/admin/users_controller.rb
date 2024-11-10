class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
    
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: "ユーザー【#{@user.name}】の退会処理が完了しました。"
  end

end
