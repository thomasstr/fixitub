class AddFreeTextAndDatesToRepairs < ActiveRecord::Migration
  def change
    change_column :repairs, :free_text, :text
    change_column :repairs, :delivered, :datetime
    change_column :repairs, :ready, :datetime
  end
end
