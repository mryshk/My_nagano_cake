class Order < ApplicationRecord
  has_many :order_products, dependent: :destroy
  belongs_to :member

  validates :postal_code, length: {is: 7}
end
