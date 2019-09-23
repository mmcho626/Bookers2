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



# 投稿者だけが編集できる　正しいコントローラどこかわからないので(仮)で入れる。どのビューかによる。（左サイドバー）
 def ensure_correct_user
    @post = Post.find_by(id:params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
  end
 end




  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password])
  end



end