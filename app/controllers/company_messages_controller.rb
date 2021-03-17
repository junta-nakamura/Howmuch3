class CompanyMessagesController < ApplicationController

  def create
    @company_message = CompanyMessage.new(company_message_params)
    if @company_message.save
      redirect_to room_path(@company_message.room.id)
    else
      render room_path(@company_message.room.id)
    end
  end

  private
  def company_message_params
    params.require(:company_message).permit(:company_id, :content).merge(company_id: current_company.id)
  end

end
