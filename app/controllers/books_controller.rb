class BooksController < ApplicationController


# 追加
before_action :authenticate, only: [:new, :create]



  def new
  	@book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end


  def index
  	@books = Book.all
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end




def update
     @book = Book.find(params[:id])
  if @book.update(book_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
  else
    render action: :edit
  end
end







  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end




   private
    def book_params
        params.require(:book).permit(:title, :body)
    end




end
