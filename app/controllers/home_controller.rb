class HomeController < ApplicationController
  def index
    @block = Block.new
    @blocks = Block.all.order(:cached_votes_up).reverse
    if current_user.present?
      @user ||= current_user
    else
      @user = nil
    end
   @comment =  Comment.new
  end
end
