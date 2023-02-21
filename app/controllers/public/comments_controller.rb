class Public::CommentsController < ApplicationController
  
  def create
    review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_content_params)
    comment.review_id = review.id
    comment.save
    redirect_to review_path(review)
  end
  
  def destroy
  
  end
  
  private

  def comment_content_params
    params.require(:comment).permit(:comment_content)
  end
  
end
