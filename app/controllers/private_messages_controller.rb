class PrivateMessagesController < ApplicationController
   before_filter :authenticate_user!

  def inbox
    @private_messages = PrivateMessage.where(read: false, receiver_id: current_user.id)
    @user ||= current_user
  end

  def outbox
    @private_messages = PrivateMessage.where(sender_id: current_user.id)
    @user ||= current_user
  end

  def new
    @user ||= current_user
    @private_message = PrivateMessage.new
  end

  def create
    @private_message = PrivateMessage.new(private_message_params)
    if @private_message.save
      flash[:notice] = 'Message was successfully sent.'
      redirect_to user_inbox_path
    else
      flash[:error] = 'One of the fields was not entered correctly. Please check them.'
      render 'new'
    end
  end

  def show
    @private_message = PrivateMessage.find(params[:id])
  end

  def mark_as_read
    message_ids = params[:messages]
    message_ids.each do |id|
      message = PrivateMessage.find(id)
      message.read = true
      message.save
    end
    redirect_to user_inbox_path
  end

private
 def private_message_params
      params.require(:private_message).permit(:body, :sender_id, :receiver_id, :subject, :sent, :read)
    end

end
