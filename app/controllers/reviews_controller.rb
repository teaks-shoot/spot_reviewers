class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to reviews_path(@review.id)
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
  end
  
  
  private
  def review_params
    params.require(:review).permit(:title, :body)
  end
  
end
