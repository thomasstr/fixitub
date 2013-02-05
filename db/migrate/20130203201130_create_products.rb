class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :p_name
      t.string :p_anr
      t.text :p_about
      t.decimal :p_price

      t.timestamps
    end
  end
end
