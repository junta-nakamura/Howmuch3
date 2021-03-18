class UsersController < ApplicationController

  def show
    if user_signed_in?
      @myPortfolios = Portfolio.includes(:user)
    elsif company_signed_in?
      @user = User.find(params[:id])
      @portfolios = Portfolio.all
      @myPortfolios = @portfolios.where(user_id: @user.id)
      
      @currentCompanyEntry = Entry.where(company_id: current_company.id)
      @userEntry = Entry.where(user_id: @user.id)
      @currentCompanyEntry.each do |cc|
        @userEntry.each do |u|
          if cc.room_id == u.room_id then
            @haveRoom = true
            @roomId = cc.room_id
          end
        end
      end 
      unless @haveRoom
        @room = Room.new
        @entry = Entry.new
      end
    else
      @user = User.find(params[:id])
      @portfolios = Portfolio.all
      @myPortfolios = @portfolios.where(user_id: @user.id)
    end
  end

end
