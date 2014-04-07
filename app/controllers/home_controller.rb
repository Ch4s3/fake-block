class HomeController < ApplicationController
  load_and_authorize_resource
   
  def index
  	@block = Block.new
  	@blocks = Block.all
  end
end
