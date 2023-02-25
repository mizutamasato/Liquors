class Public::CommentsController < ApplicationController

  def create
    @review = Review.find(params[:review_id])
    @comment = current_user.comments.new(comment_content_params)
    @comment.review_id = @review.id
    if @comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to review_path(@review)
    else
      render 'public/reviews/show'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to review_path(comment.review), notice: "コメントを削除しました"
  end

  private

  def comment_content_params
    params.require(:comment).permit(:comment_content)
  end

end
