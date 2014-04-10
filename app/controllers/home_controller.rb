class HomeController < ApplicationController
	def index
    @block = Block.new
    @blocks = Block.all
    @user = current_user
  end
end
