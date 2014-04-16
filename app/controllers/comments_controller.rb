class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.block_id = params[:block_id]
    @comment.user_id = params[:user_id]

    @comment.save

    redirect_to blocks_url
  end

  def comment_params
    params.require(:comment).permit(:body, :block_id, :user_id)
  end

end
