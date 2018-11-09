require "rails_helper"

RSpec.describe Publisher, type: :model do
  context "Publisher structure" do
    it "Has a name" do
      publisher = Publisher.find_or_create_by(:name => "Robert")
      expect(publisher.name).to eq ("Robert")
    end

    it "Creates a list of books" do
      publisher = Publisher.find_or_create_by(:name => "Robert")
      publisher.create_book("Adventures of Robert")
      publisher.create_book("Robert's Adventures")
      publisher.create_book("Robert's Memoirs")
  
      expect(publisher.books.length).to be >= 2
      expect(publisher.books.pluck(:title)).to include("Adventures of Robert")
      expect(publisher.books.pluck(:title)).to include("Robert's Memoirs")
    end


    it "Distributes book" do
      shop = Shop.find_or_create_by(name: "Amazon")
      publisher = Publisher.find_or_create_by(name: "Roesmary")
      book1 = publisher.create_book("Rosemary's world")
      book2 = publisher.create_book("Rosemary's Adventures")
      publisher.distribute(book1.id, shop.id)
      publisher.distribute(book2.id, shop.id)
      expect(Shop.find_by(name: "Amazon").books.length).to be >= 2
    end
  end
end
