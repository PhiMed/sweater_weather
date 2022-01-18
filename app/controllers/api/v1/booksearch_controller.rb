class Api::V1::BooksearchController < ApplicationController
  def search
    booksearch = BooksFacade.aggregate(booksearch_params[:location], booksearch_params[:quantity])

    render json: BooksSerializer.new(booksearch), status: 201
  end

  private

  def booksearch_params
    params.permit(:location, :quantity)
  end
end
