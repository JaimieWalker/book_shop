require "rails_helper"

RSpec.describe Book, type: :model do
  publisher = Publisher.find_or_create_by(name: "Anthony")

  context "Books must have a publisher and title" do
    book = Book.find_or_create_by(:title => "American Dream", :publisher_id => publisher.id)

    it "has title" do
      expect(Book.find_by(title: "American Dream").title).to eq ("American Dream")
    end

    it "has publisher" do
      expect(book.publisher).to eq (publisher)
    end

    it "Can be distributed to a shop " do
      book = Book.find_or_create_by(title: "Making trees from books", publisher_id: publisher.id)
      shop = Shop.find_or_create_by(name: "Former Tree")
      book.distribute(shop.id)
      expect(shop.books.find(book.id).id).to eq(book.id)
    end
  end
end
