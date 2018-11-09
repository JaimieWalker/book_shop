class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    shop = Shop.find(params["id"])
    books = shop.books.where("copies_sold >= ?", 0).select(:id, :title, :copies_sold, :copies_in_stock)
    shop.books_sold_count
    sold = {"books_sold_count" => shop.books_sold_count, "books" => books}
    render json: sold
  end
end
