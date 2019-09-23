class ApplicationController < ActionController::Base






  before_action :authenticate_user!


  before_action :configure_permitted_parameters, if: :devise_controller?



  # エラー原因の記述 ヘッダー切り替わらなくなる
  #(before_action :current_user)
  # def current_user
  # return unless session[:user_id]
  # @current_user ||= User.find(session[:user_id])
  # end

before_action :set_current_user

def set_current_user
  current_user = User.where(id: session[:user_id])
end







  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
  end



end