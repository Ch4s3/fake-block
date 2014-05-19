class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.create( user_params )
    Search.index_user(@user)
  end

  
  def edit
  end
  
  def update
    @user = User.find(params[:id])
    @user.profile = {age: params[:age], likes: params[:likes].split, from: params[:from] }

    if @user.update(user_params)
      Search.index_user(@user)
      redirect_to user_path, :notice => "User updated."
    else
      redirect_to user_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end
  private
  def user_params
      params.require(:user).permit(:name)
    end
end
