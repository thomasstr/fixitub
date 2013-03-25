class AddProductIdToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :product_id, :integer
  end
end
