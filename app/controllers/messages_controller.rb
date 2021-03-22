class MessagesController < ApplicationController

  def create
    @message = Message.create(message_params)
    if @message.id.present?
      @message.user = current_user
      @message.company = current_company
      @message.save
      redirect_to room_path(params[:room_id])
    else
      render room_path(params[:room_id])
    end
  end
  
  private
  def message_params
    params.require(:message).permit(:content, :room_id)
  end
  
end
