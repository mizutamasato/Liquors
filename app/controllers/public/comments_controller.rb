class Public::CommentsController < ApplicationController

  def create
    review = Review.find(params[:review_id])
    comment = current_user.comments.new(comment_content_params)
    comment.review_id = review.id
    comment.save
    flash[:notice] = "コメントを投稿しました"
    redirect_to review_path(review)
  end

  def destroy
    Comment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to review_path(review)
  end

  private

  def comment_content_params
    params.require(:comment).permit(:comment_content)
  end

end
