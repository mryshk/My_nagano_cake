class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :member_id
      t.integer :shipping_price, default: 800
      t.integer :total_payment
      t.integer :payment_method, default: 0
      t.string :name
      t.string :address
      t.string :postal_code
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
