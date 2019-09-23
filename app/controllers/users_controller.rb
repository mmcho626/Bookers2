class UsersController < ApplicationController


  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to users_path
    end
  end


  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(@user.id)
  end





private
def user_params
    params.require(:user).permit(:name, :profile_image)
end


end