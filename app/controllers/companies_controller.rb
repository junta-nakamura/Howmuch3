class CompaniesController < ApplicationController

  before_action :set_company

  def show
  end
  
  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to company_path(current_company)
    else
      render :edit
    end
  end

  private
  def set_company
    @company = company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:company_name, :company_phone, :postal_code, :prefecture_id, :municipalities, :house_number, :building)
  end

end
