class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    if user_signed_in?
      @user = current_user
      @myPortfolios = Portfolio.where(user_id: current_user.id)
    elsif company_signed_in?
      @user = User.find(params[:id])
      @myPortfolios = Portfolio.where(user_id: @user.id)
      @roomMatch = Room.where(company_id: current_company.id).where(user_id: @user.id)
      if @roomMatch.present?
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

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :user_image, :type_id, :introduction)
  end
end