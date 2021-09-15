class Address < ApplicationRecord
  
  belongs_to :mem
  validates :postal_code, length: {is: 7}
end
