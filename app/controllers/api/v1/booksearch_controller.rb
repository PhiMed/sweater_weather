class Api::V1::BooksearchController < ApplicationController
def search
  booksearch = BooksearchFacade.aggregate(booksearch_params[:destination])

  render json: BooksearchSerializer.new(booksearch), status: 201
end

private

def booksearch_params
  params.permit(:destination)
end
end
