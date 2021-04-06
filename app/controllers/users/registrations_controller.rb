class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters

  def after_sign_up_path_for(resource)
    @portfolio = Portfolio.new
    new_portfolio_path
  end
  
  def after_sign_in_path_for(resource)
    portfolio_path(current_user.id)
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday, :user_image, :introduction])
  end

end