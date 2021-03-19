class RoomsController < ApplicationController
  before_action :authenticate_company!, only: [:create]

  def index
    if company_signed_in?
      @companyRooms = current_company.rooms.includes(:company_messages).order("messages.created_at desc")
    elsif user_signed_in?
      @userRooms = current_user.rooms.includes(:messages).order("messages.created_at desc")
    end
  end

  def create
    @room = Room.where(user_id: params[:user_id], company_id: params[:company_id])
    if @room.present?
      redirect_to room_path(@room.id)
    else
      @room = Room.create(room_params)
      redirect_to room_path(@room.id)
    end
  end

  def show
    @room = Room.find(params[:id])
    # if Room.where(id: @room.id, company_id: current_company.id).present?
    @messages = @room.messages.includes(:user).order("created_at asc")
    @companyMessages = @room.company_messages.includes(:company).order("created_at asc")
    @message = Message.new
    @companyMessage = CompanyMessage.new
    # else
    #   redirect_back(fallback_location: root_path)
    # end
  end   

  private
  def room_params
    params.require(:room).permit(:user_id, :company_id)
  end

end
