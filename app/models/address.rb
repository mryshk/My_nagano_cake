class Address < ApplicationRecord

  belongs_to :menber
  validates :postal_code, length: {is: 7}
end
