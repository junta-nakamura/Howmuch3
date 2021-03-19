class MessagesController < ApplicationController

  def create
    if @message = Message.create(message_params)
      redirect_to room_path(@message.room.id)
    else
      render room_path(@message.room.id)
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :content, :room_id)
  end
  
end
