class RoomsController < ApplicationController
  before_action :authenticate_company!

  def index
    @cc_rooms = current_company.rooms.includes(:messages).order("messages.created_at desc")
  end

  def create
    # @room = Room.create(room_params)
    @room = Room.create
    # @entrycompany = entry.create(company_id: current_company.id, user_id: params[:user_id], room_id: @room.id)
    @entryCompany = Entry.create(join_room_params)
    redirect_to root_path
    # redirect_to room_path(@room.id)
    # @joinUser = entry.create(join_room_params)
    # @first_message = @room.messages.create(company_id: current_company.id, user_id: join_room_params[:user_id], content: "hello world")
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(company_id: current_company.id, user_id: params[:user_id], room_id: @room.id).present?
      @messages = @room.messages.includes(:user).order("created_at asc")
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def join_room_params
    params.require(:entry).permit(:user_id, :company_id, :room_id).merge(room_id: @room.id)
  end

  # def room_params
  #   params.permit(user_id: params[:user_id], company_id: params[:company_id])
  # end

end