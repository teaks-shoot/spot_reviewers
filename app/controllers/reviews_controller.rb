class ReviewsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  
  
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review.id)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
    @user = @review.user
  end

  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to '/reviews'
  end  
  
  
  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
  
  def is_matching_login_user
    review = Review.find(params[:id])
    unless review.user.id == current_user.id
      redirect_to reviews_path
    end
  end
  
end