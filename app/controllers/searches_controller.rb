class SearchesController < ApplicationController

  def index
    range = params[:range]
    word = params[:word]
    development_language_id = params[:development_language_id]
    business_type_id = params[:business_type_id]
    sale_type_id = params[:sale_type_id]
    price = params[:price]

    @companyRooms = Room.where(company_id: current_company.id)
    @portfolios = Portfolio.all.order(id: "DESC")

    if range == "1"
      @user = User.search(word)
    elsif range == "2"
      @portfolio = Portfolio.search(word,development_language_id,business_type_id,sale_type_id,price).order(id: "DESC")
    else
      render "portfolios/index"
    end
  end

end
