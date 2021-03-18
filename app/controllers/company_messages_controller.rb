class CompanyMessagesController < ApplicationController

  def create
    @companyMessage = CompanyMessage.new(company_message_params)
    if @companyMessage.save
      redirect_to room_path(@companyMessage.room.id)
    else
      render room_path(@companyMessage.room.id)
    end
  end

  private
  def company_message_params
    params.require(:company_message).permit(:content, :company_id, :room_id)
  end

end
