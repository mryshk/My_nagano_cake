class Address < ApplicationRecord

  belongs_to :member
  validates :postal_code, length: {is: 7}
end
