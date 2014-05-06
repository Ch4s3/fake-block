class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      flash[:success] = "Successfully commented"
      redirect_to :back
    else
      flash[:error] = "Please fill out the comment body"
      redirect_to root_path
    end  
  end

  def show
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body, :block_id, :user_id)
  end

end
