class MessagesController < ApplicationController

  def create
    @message = Message.create(message_params)
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :content).merge(user_id: current_user.id)
  end
  
end
