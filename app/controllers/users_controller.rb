class UsersController < ApplicationController

  def show
    if user_signed_in?
      @user = current_user
      portfolios = Portfolio.all
      @my_portfolios = @user.portfolios
    elsif company_signed_in?
      @user = User.find(params[:id])
      @portfolios = Portfolio.all
      @my_portfolios = @portfolios.where(user_id: @user.id)
      
      @currentcompanyentry = entry.where(company_id: current_company.id)
      @userentry = entry.where(user_id: @user.id)
      # unless @user.id == current_company.id
      @currentcompanyentry.each do |ca|
        @userentry.each do |u|
          if ca.room_id == u.room_id then
            @haveRoom = true
            @roomId = ca.room_id
          end
        end
      end 
      unless @haveRoom
        @room = Room.new
        @roomcount = Room.count
        @entry = entry.new
      end
    else
      @user = User.find(params[:id])
      @portfolios = Portfolio.all
      @my_portfolios = @portfolios.where(user_id: @user.id)
    end
  end


end
