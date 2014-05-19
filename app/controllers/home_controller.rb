class HomeController < ApplicationController
  def index
    @private_message = PrivateMessage.new
    @block = Block.new
    @blocks = Block.not_expired.order(:cached_votes_up).reverse
    @comment =  Comment.new
  end
end
