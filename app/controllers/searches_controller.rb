class SearchesController < ApplicationController

  def index
    render json: Search.terms_for(params[:term])
  end

  def search
  	search_params = params[:search]
  	@blocks = Block.text_search(search_params)
    @users = User.text_search(search_params)
  end
end
