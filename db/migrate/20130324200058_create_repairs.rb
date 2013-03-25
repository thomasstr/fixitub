class CreateRepairs < ActiveRecord::Migration
  def change
    create_table :repairs do |t|
      t.string :name
      t.string :email
      t.string :phone_model

      t.timestamps
    end
  end
end
