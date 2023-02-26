class Admin::ReviewsController < ApplicationController


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

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "対象の投稿を削除しました"
    redirect_to admin_reviews_path
  end
end
