class Publisher < ApplicationRecord
  has_many :books
  has_many :shops, through: :books

  def create_book(title)
    book = Book.find_or_create_by(title: title) do |current|
      current.publisher_id = self.id
      current.copies_in_stock = 0
      current.copies_sold = 0
    end
  end

  # Whenever a book is distributed, the location gets 20 of those books
  def distribute(book_id, shop_id)
    book = Book.find(book_id)
    shop = Shop.find(shop_id)
    book.update(copies_in_stock: book.copies_in_stock += 20, shop_id: shop_id)
    shop.books << book
  end
end
