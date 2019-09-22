class BooksController < ApplicationController


# 追加


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
    render 'index'
  end

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
