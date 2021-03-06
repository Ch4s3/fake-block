class FriendsController < ApplicationController
before_filter :authenticate_user!

	def index
		@user = User.find(params[:user_id])
	end

	def show
		redirect_to user_path(params[:id])
	end

	def new
		@friendship1 = Friendship.new
		@friendship2 = Friendship.new
	end

	def create
		@user = User.find(current_user)
		@friend = User.find(params[:friend_id])
		params[:friendship1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'requested'}
		params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'pending'}
		@friendship1 = Friendship.create(friendship1_params)
		@friendship2 = Friendship.create(friendship2_params)
		
		if @friendship1.save && @friendship2.save
			redirect_to user_friends_path(current_user)
		else
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(current_user)
		@friend = User.find(params[:id])
		params[:friendship1] = {:user_id => @user.id, :friend_id => @friend.id, :status => 'accepted'}
		params[:friendship2] = {:user_id => @friend.id, :friend_id => @user.id, :status => 'accepted'}
		@friendship1 = Friendship.find_by_user_id_and_friend_id(@user.id, @friend.id)
		@friendship2 = Friendship.find_by_user_id_and_friend_id(@friend.id, @user.id)
		
		if @friendship1.update_attributes(friendship1_params) && @friendship2.update_attributes(friendship2_params)
			flash[:notice] = 'Friend sucessfully accepted!'
			redirect_to user_friends_path(current_user)
		else
			redirect_to user_path(current_user)
		end
	end

	def destroy
		@user = User.find(params[:user_id])
		@friend = User.find(params[:id])
		@friendship1 = @user.friendships.find_by_friend_id(params[:id]).destroy
		@friendship2 = @friend.friendships.find_by_user_id(params[:id]).destroy
		redirect_to user_friends_path(:user_id => current_user)
	end

private
	def friendship1_params
    params.require(:friendship1).permit(:user_id, :friend_id, :status)
  end
    def friendship2_params
    params.require(:friendship2).permit(:user_id, :friend_id, :status)
  end
end
