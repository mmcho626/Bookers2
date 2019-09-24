class BooksController < ApplicationController


# 追加


  def new
  	@book = Book.new
  end




  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
  if book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(book.id)
  else
    render 'index'
  end

  end




  def index
  	@books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user_id
  end

  def edit
      @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      flash[:notice] = "権限がありません"
      redirect_to books_path
    end


  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  else
    render action: :edit
  end

  end




def update
     book = Book.find(params[:id])
  if book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(book.id)
  else
    render action: :edit
  end
end


  def destroy
     book = Book.find(params[:id])
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