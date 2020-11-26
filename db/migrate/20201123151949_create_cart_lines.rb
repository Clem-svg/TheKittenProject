class CreateCartLines < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_lines do |t|
      t.integer :quantity, default: 1
      t.belongs_to :item, index: true
      t.belongs_to :cart, index: true

      t.timestamps
    end
  end
end
