class Companies::RegistrationsController < Devise::RegistrationsController
  
  before_action :configure_permitted_parameters

  def after_sign_up_path_for(resource)
    portfolios_path
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name, :company_phone, :postal_code, :prefecture_id, :municipalities, :house_number, :building, :company_image])
  end

end
