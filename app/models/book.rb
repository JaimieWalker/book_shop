class Book < ApplicationRecord
  belongs_to :publisher
  belongs_to :shop, optional: true

  def distribute(shop_id)
    shop = Shop.find(shop_id)
    shop.update(books_sold_count: 0)
    if self.copies_in_stock.nil?
      self.update(copies_in_stock: 0, copies_sold: 0)
    end

    self.update(copies_in_stock: self.copies_in_stock += 20, shop_id: shop_id)
  end
end
