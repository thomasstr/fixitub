class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :c_name

      t.timestamps
    end
  end
end
