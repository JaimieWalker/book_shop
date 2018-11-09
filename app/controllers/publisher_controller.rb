class PublisherController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def show
    @publisher = Publisher.find(params[:id])
    shops = {"Shops" => @publisher.shops.select(:id, :name, :books_sold_count).order(books_sold_count: :desc).uniq}
    result = {"Shops" => shops["Shops"].as_json}
    books = shops["Shops"]
    books.each_with_index do |book, index|
      books_in_stock = book.books_in_stock(@publisher.id)
      result["Shops"][index]["books_in_stock"] = books_in_stock.select(:id, :title, :copies_in_stock)
    end
    result["Shops"].delete_if { |element| element["books_in_stock"].empty? }
    render json: result
  end
end
