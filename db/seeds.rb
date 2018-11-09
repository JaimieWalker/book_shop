# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publisher_list = [
  "Cory", "Johnathan", "Jeff",
  "Elliot", "Sam", "Tom",
  "Joe", "Elaine", "Jody",
  "Juan", "Joy", "Charles",
  "Stephen", "Paul", "Michael",
  "Nathan", "Perry", "Nora",
]

publisher_list.each do |name|
  Publisher.find_or_create_by(name: name)
end

shop_list = [
  "Ebay", "Amazon", "Barnes & Noble", "craigslist", "Book Worm",
  "Book City", "Books",
]

shop_list.each do |name|
  Shop.find_or_create_by(name: name) do |shop|
    shop.books_sold_count = 0
  end
end

book_list = ["First Book", "Some Book", "A Book", "Good Book", "All Day",
             "Welcome", "Adventures of Reinbach", "Chopin's Instruments", "Another Day",
             "Imagine that", "Wonderful idea", "Hold On", "The Best Recipe", "Secret secrets", "This ones for you", "Another One", "I am Persuaded", "Little Governor", "Eons and Epochs", "Just one more", "My Victory", "Last Book", "Barbecuing", "Poaching", "Cooking", "Baking", "Frying", "Coding", "Reading", "Eating", "Delicious Food", "Home of the Brave", "The mediocre Gatsby"]

book_list.each do |title|
  Book.find_or_create_by(title: title) do |book|
    book.publisher_id = Publisher.all.sample.id
    book.copies_in_stock = 0
    book.copies_sold = 0
  end
end

Publisher.all.each do |publisher|
  publisher.books.each do |book|
    publisher.distribute(book.id, Shop.all.sample.id)
  end
end

Shop.all.each do |shop|
  shop.books.each do |book|
    selling = rand(0..40)
    selling.times do
      shop.sell(book.title) if (book.copies_in_stock > 0)
    end
  end
end
