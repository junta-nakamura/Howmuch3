class SearchesController < ApplicationController

  def index
    range = params[:range]
    word = params[:word]
    development_language = params[:development_language]
    business_type = params[:business_type]
    sale_type= params[:sale_type]
    price = params[:price]

    @companyRooms = Room.where(company_id: current_company.id)
    @portfolios = Portfolio.all.order(id: "DESC")

    if range == "1"
      @user = User.search(word)
    elsif range == "2"
      @portfolio = Portfolio.search(word,development_language,business_type,sale_type,price).order(id: "DESC")
    else
      render "portfolios/index"
    end
  end

end
