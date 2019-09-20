class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@user = User.find(params[:id])
  end




 def edit
        @user = User.find(params[:id])
 end


 def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
end



# 投稿者だけが編集できる　正しいコントローラどこかわからないので(仮)で入れる。どのビューかによる。（左サイドバー）

 def ensure_correct_user
    @book = Book.find_by(id:params[:id])
    if @book.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/books/index")
  end




private
def user_params
    params.require(:user).permit(:name, :profile_image)
end


end