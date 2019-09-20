class ApplicationController < ActionController::Base

  before_action :authenticate_user!


  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
  end







before_action :current_user

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end




# 投稿者だけが編集できる　正しいコントローラどこかわからないので(仮)で入れる。どのビューかによる。（左サイドバー）

 def ensure_correct_user
    @book = Book.find_by(id:params[:id])
    if @book.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/books/index")
  end




end
