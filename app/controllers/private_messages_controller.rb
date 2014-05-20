class PrivateMessagesController < ApplicationController
   before_filter :authenticate_user!

  def received
    @private_messages = PrivateMessage.where(read: false, receiver_id: current_user.id)
    @private_message = PrivateMessage.new
  end

  def opened
    @private_messages = PrivateMessage.where(read: true, receiver_id: current_user.id)
    @private_message = PrivateMessage.new
  end

  def sent
    @private_messages = PrivateMessage.where(sender_id: current_user.id)
    @private_message = PrivateMessage.new
  end

  def new
    @user||= current_user
    @private_message = PrivateMessage.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    
    @private_message = PrivateMessage.new(private_message_params)
    
    if params_receiver != nil
      receiver = params_receiver
      @private_message.receiver_id = receiver.id
    end

    if @private_message.save
      flash[:success] = 'Message was successfully sent.'
      redirect_to :back
    else
      flash[:error] = 'One of the fields was not entered correctly. Please check them.'
      redirect_to :back
    end
  end

  def show
    @pm = PrivateMessage.find(params[:id])
    @private_message = PrivateMessage.new
  end

  def mark_as_read
    message_ids = params[:messages]
    message_ids.each do |id|
      message = PrivateMessage.find(id)
      message.read = true
      message.save
    end
    redirect_to user_received_path
  end

private
 def private_message_params
      params.require(:private_message).permit(:body, :sender_id, :subject, :sent, :read)
  end

  def params_receiver
    User.where('name = ?', params[:private_message][:receiver]).first
  end
end
