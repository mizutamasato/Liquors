class Public::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
    @review = Review.new
  end
  
  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end
  
  def edit
    @review = Review.find(params[:id])
  end
  
  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "編集が保存されました"
      redirect_to review_path(@review)
    else
      edit_review_path(@review)
    end
    
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to reviews_path
    
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to reviews_path
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

