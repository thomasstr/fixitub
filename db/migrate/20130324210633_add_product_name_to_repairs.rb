class AddProductNameToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :product_name, :string
  end
end
