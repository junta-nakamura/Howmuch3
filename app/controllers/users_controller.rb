class UsersController < ApplicationController

  def show
    if user_signed_in?
      @myPortfolios = Portfolio.where(user_id: current_user.id)
    elsif company_signed_in?
      @user = User.find(params[:id])
      @myPortfolios = Portfolio.where(user_id: @user.id)
      if @roomMatch = Room.where(company_id: current_company.id).where(user_id: @user.id)
        @haveRoom = true
        @roomId = @roomMatch.ids
      else
        @room = Room.new
      end
    else
      @user = User.find(params[:id])
      @myPortfolios = Portfolio.includes(:user)
    end
  end

end