class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book =Book.new
  end
  
  def create
     @book = Book.new(book_params)
    if @book.save
      redirect_to #マイページのパスを入れる　book_path(@book)
      flash[:notice] = "You have created book successfully"
    else
      @books = Book.all
      flash[:alert] = "error"
      render action: :index
    end
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
    redirect_to #book show のパスを入れる　book_path(@book)
    flash[:notice] = "You have updated successfully"
    else
    flash[:alert] = "error"
    render action: :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to # book_index のパスを入れる　books_path
    flash[:notice] = "You have deleted successfully"
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body )
  end
  
end
