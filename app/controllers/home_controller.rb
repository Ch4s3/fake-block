class HomeController < ApplicationController
   
  def index
  	@block = Block.new
  	@blocks = Block.all
  end
end
