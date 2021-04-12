class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :destroy]
  # GET /books or /books.json
  def index
    @books = Book.all
    # @v = params[:r]
    # puts params
  end

  # GET /books/1 or /books/1.json
  def show
    # render plain: params[:id]
  end

  # GET /books/new
  def new
    # @book = Book.new
    @book=current_user.book.build
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    # @book = Book.new(book_params)
    @book=current_user.book.build(book_params)
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: "Appointment is successfully booked." }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Appointment is successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: "Appointment is successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @book = current_user.book.find_by(id: params[:id])
    redirect_to books_path, notice: "Not Authorised" if @book.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end




    # Only allow a list of trusted parameters through.
    def book_params
      params.require(:book).permit(:name, :address, :age,:email,:user_id,:contact_number,:date)
    end
end
