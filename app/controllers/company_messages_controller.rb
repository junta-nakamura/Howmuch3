class CompanyMessagesController < ApplicationController

  def create
    @companyMessage = CompanyMessage.new(company_message_params)
    if @companyMessage.save
      redirect_to room_path(@companyMessage.room_id)
    else
      render "rooms/show"
    end
  end

  private
  def company_message_params
    params.permit(:company_id, :content, :room_id).merge(company_id: current_company.id)
  end

end
  