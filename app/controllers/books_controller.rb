class BooksController < ApplicationController



  before_action :authenticate_user!

  def new
  	@book = Book.new
  end




  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render 'index'
  end

  end




  def index
    @book = Book.new
  	@books = Book.all
    @users = User.all
    @user = current_user #books一覧では自分の画像が表示される。current_userカラムの"レコード"を渡すので、右辺はcurrent_userと表記。
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new # renderでshowページにsidebar.html.erbを呼び出すための変数を定義
    @user = User.find(params[:id])
  end

  def edit
    @book_new = Book.new # renderでeditページにsidebar.html.erbを呼び出すための変数を定義
      @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to books_path
    end

  end




def update
     @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book)
   else
    @books = Book.all
    render 'index'
  end
end


  def destroy
    book = Book.find(params[:id]) @book= Bookd.find(params[:book_id])
    book.destroy
    redirect_to books_path
  end


  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
  end






 # BookImages の記述

#   def new
#     @book_image = BookImage.new
#     end

#     def create
#     @book_image = BookImage.new(book_image_params)
#     @book_image.user_id = current_user.id
#     @book_image.save
#     redirect_to book_images_path
#     end

#     def index
#         @book_images = BookImage.all
#         @books = Book.all
#     end

#     def show
#     end


# private
#     def book_image_params
#         params.require(:book_image).permit(:title, :image, :body)
#     end

# end