class Product < ApplicationRecord
  belongs_to :genre

  has_many :cart_products
  has_many :orders, through: :order_products
  has_many :order_products
  attachment :image
end
