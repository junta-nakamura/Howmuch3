class CompaniesController < ApplicationController

  before_action :set_company
  before_action :ser_rooms, only: [:show, :edit]

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
    @company = Company.find(params[:id])
  end

  def company_params
    params.require(:company).permit(:company_name, :company_phone, :postal_code, :prefecture_id, :municipalities, :house_number, :building, :company_image)
  end

  def ser_rooms
    if company_signed_in?
      @companyRooms = Room.where(company_id: current_company.id)
    end
  end

end
