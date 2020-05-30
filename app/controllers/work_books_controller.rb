class WorkBooksController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @work_books = @user.work_books
  end

  def new
    @user = User.find(params[:user_id])
    work =  @user.work_books.last
    if work.present?
      if work.created_at.today?
        @edit_work_book = @user.work_books.where('created_at >= ?', Time.zone.now.beginning_of_day).first
      else
        @work_book = @user.work_books.build
      end
    else
      @work_book = @user.work_books.build
    end
  end

  def create
    @user = User.find(params[:work_book][:user_id])
    @work_book = @user.work_books.build(work_book_params)
    if @work_book.save
      flash[:success] = "#{ l @work_book.created_at, format: :minuts} 出勤しました。"
      redirect_to root_path
    else
      flash[:alert] = '打刻できませんでした'
      render 'new'
    end
  end

  def update
    work_book = WorkBook.find(params[:id])
    if work_book.update_attributes(updated_at: Time.zone.now)
      flash[:success] = "#{ l work_book.updated_at, format: :minuts} 退勤しました。"
      redirect_to root_path
    else
      flash[:alert] = '打刻できませんでした。'
      render 'new'
    end
  end
  private

    def work_book_params
      params.require(:work_book).permit(:paid, :user_id)
    end
end
