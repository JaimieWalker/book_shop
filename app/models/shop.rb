class Shop < ApplicationRecord
  has_many :books
  has_many :publishers, through: :books

  # Distributes a book in the current shop
  def distribute(book_id)
    book = Book.find(book_id)
    if (book.copies_in_stock.nil?)
      book.update(copies_in_stock: 0, copies_sold: 0)
    end
    book.update(copies_in_stock: book.copies_in_stock += 20, shop_id: self.id)
  end

  def books_in_stock(publisher_id)
    self.books.where(publisher_id: publisher_id).where("copies_in_stock > ?", 0)
  end

  # Sells one book at a time
  def sell(name)
    book = Book.find_by(title: name)
    # book = self.books.find_by(title: name)
    if (book && book.copies_in_stock > 0)
      book.update(copies_in_stock: book.copies_in_stock -= 1, copies_sold: book.copies_sold += 1)
      self.update(books_sold_count: self.books_sold_count += 1)
    end
    return book
  end
end
