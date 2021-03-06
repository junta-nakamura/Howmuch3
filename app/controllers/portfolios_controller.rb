class PortfoliosController < ApplicationController

  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :ser_rooms, only: [:index, :new, :show, :edit]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def top
  end

  def index
    @portfolios = Portfolio.all.order(id: "DESC")
    @companyRooms = Room.where(company_id: current_company.id)
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.price.blank?
      @portfolio.price = 0
    end
    
    if @portfolio.save
      redirect_to user_path(current_user.id)
    else
      render new_portfolio_path
    end
  end

  def edit
  end

  def update
    if @portfolio.update(portfolio_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @portfolio.destroy
    redirect_to user_path(current_user.id)
  end
  
  private
  def portfolio_params
    params.require(:portfolio).permit(:portfolio_name, :detail, :development_language_id, :business_type_id, :sale_type_id, :price, images: []).merge(user_id: current_user.id)
  end

  def set_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

  def ser_rooms
    if user_signed_in?
      @userRooms = Room.where(user_id: current_user.id)
    elsif company_signed_in?
      @companyRooms = Room.where(company_id: current_company.id)
    end
  end

end