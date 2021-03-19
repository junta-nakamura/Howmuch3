class CompanyMessagesController < ApplicationController

  def create
    @companyMessage = CompanyMessage.create(company_message_params)
    if @companyMessage
      binding.pry
      redirect_to room_path(@companyMessage.room_id)
    else
      render room_path(@companyMessage.room_id)
    end
  end

  private
  def company_message_params
    params.permit(:company_id, :content, :room_id).merge(company_id: current_company.id)
  end

end
