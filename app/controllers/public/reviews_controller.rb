class Public::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
    
  end
  
  def show
    @review = Review.find(params[:id])
    
  end
  
  def edit
    
  end
  
  def update
    
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to reviews_path
    
  end
  
  def destroy
    
  end
  
  def new
    @review = Review.new
    
  end
  
  def search
    
  end
  
  
  private

  def review_params
    params.require(:review).permit(:name, :image, :user_id, :price, :explanation)
  end
end

