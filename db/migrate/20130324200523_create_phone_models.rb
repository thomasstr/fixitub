class CreatePhoneModels < ActiveRecord::Migration
  def change
    create_table :phone_models do |t|
      t.string :name

      t.timestamps
    end
  end
end
