class Api::V1::BooksearchController < ApplicationController
  def search
    booksearch = BooksearchFacade.aggregate(booksearch_params[:location])

    render json: BooksearchSerializer.new(booksearch), status: 201
  end

  private

  def booksearch_params
    params.permit(:location)
  end
end
