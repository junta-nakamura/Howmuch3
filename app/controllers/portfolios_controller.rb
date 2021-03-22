class PortfoliosController < ApplicationController

  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]
  before_action :ser_rooms, only: [:index, :new, :show, :edit]

  def top
  end

  def index
    @portfolios = Portfolio.all.order(id: "DESC")
  end

  def show
  end

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    if @portfolio.save
      redirect_to user_path(current_user.id)
    else
      render new_portfolio_path
    end
  end

  def edit
    @portfolios = Portfolio.all
    @myPortfolios = @portfolios.where(user_id: current_user.id)
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
    params.require(:portfolio).permit(:portfolio_name, :detail, :type_id, images: []).merge(user_id: current_user.id)
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