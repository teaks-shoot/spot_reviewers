class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin'
    
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end  
  
end
