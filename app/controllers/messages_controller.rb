class MessagesController < ApplicationController

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to room_path(params[:room_id])
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def message_params
    if user_signed_in?
      params.require(:message).permit(:content, :room_id, :message_image).merge(user_id: current_user.id)
    elsif company_signed_in?
      params.require(:message).permit(:content, :room_id, :message_image).merge(company_id: current_company.id)
    end
  end
  
end
