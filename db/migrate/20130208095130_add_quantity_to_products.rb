class AddQuantityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :qty, :integer
  end
end
