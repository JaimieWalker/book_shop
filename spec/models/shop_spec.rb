require "rails_helper"

RSpec.describe Shop, type: :model do
  it "can have multiple books" do
    shop = Shop.find_or_create_by(:name => "Amazon")
    shop.distribute(Book.all.sample.id)
    shop.distribute(Book.all.sample.id)
    expect(shop.books.length).to be > 1
  end

  it "Shops sell books" do
    name = "Fun Day"
    publisher = Publisher.find_or_create_by(name: "Ellen")
    book = publisher.create_book(name)
    shop = Shop.find_or_create_by(:name => "Ebay")
    publisher.distribute(book.id, shop.id)
    shop.books << book
    expect { shop.sell(name) }.to change { book.reload.copies_in_stock }.by(-1)
  end
end
