class RoomsController < ApplicationController
  before_action :authenticate_company!, only: [:create]
  before_action :ser_rooms, only: [:index, :show]

  def index
    @message = Message.new
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
    @messages = @room.messages.includes(:user, :company).order("created_at asc")
    @message = Message.new
  end   

  private
  def room_params
    params.require(:room).permit(:user_id, :company_id)
  end

  def ser_rooms
    if user_signed_in?
      @rooms = Room.where(user_id: current_user.id).order(created_at: :desc)
    elsif company_signed_in?
      @rooms = Room.where(company_id: current_company.id).order(created_at: :desc)
    end
  end
  
end
