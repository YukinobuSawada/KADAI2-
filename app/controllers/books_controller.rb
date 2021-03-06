class BooksController < ApplicationController
 def top
end
  def index
  @book = Book.new
  @books =Book.all

end

  def show
  	@book = Book.find(params[:id])
  end

  def new

  end

  def edit
   @book = Book.find(params[:id])
  end

  def create
  	@book=Book.new(book_params)
  	@book.save
  	if @book.save
  	redirect_to book_path(@book.id),notice:"Book was successfully created."
    else
      @books = Book.all
    render:index  
  end
end
def update
	@book = Book.find(params[:id])
	@book.update(book_params)
	if @book.update(book_params)
  	redirect_to book_path(@book.id),notice:"Book was successfully updated."
  else
    render :edit
end
end

def destroy
	book = Book.find(params[:id])
	book.destroy
	redirect_to books_path
end

  private
  def book_params
  	params.require(:book).permit(:title,:body)
  end
end
