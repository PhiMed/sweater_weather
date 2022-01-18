class Api::V1::BooksController < ApplicationController
  def search
    book_search = BooksFacade.aggregate(books_params[:location], books_params[:quantity])

    render json: BooksSerializer.new(book_search), status: 201
  end

  private

  def books_params
    params.permit(:location, :quantity)
  end
end
