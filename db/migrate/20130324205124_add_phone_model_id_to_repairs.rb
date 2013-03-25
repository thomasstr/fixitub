class AddPhoneModelIdToRepairs < ActiveRecord::Migration
  def change
    add_column :repairs, :phone_model_id, :integer
  end
end
