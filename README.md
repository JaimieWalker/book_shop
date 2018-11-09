#README

After configuring database for your local machine

Run rails db:create
    rails db:migrate
    rails db:migrate RAILS_ENV=test
    rails db:seed
    rails db:seed RAILS_ENV=test

After all of these steps are taken, you can run rspec to run the current tests. 

You can also start the server with rails s on the development environment. When you run the server, The page that pops up has a list of publishers created from seed.db. 

Clicking the name will result in a a list of shops selling at least one book of that publisher. Shops are  ordered by the number of books sold. Each shop includes the list of a Publisher’s book(s) that are currently in stock.

Click the Go to shop link, to bring you to a list of all shops.
When you click on a shop, you get a list of all books in the shop, whether any books were sold or not

