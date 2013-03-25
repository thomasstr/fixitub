class Repair < ActiveRecord::Base
  attr_accessible :email, :name, :phone_model, :phone_model_id, :product_id, :product_name, :free_text, :delivered, :ready

  validates :email, :name, :phone_model_id, :product_id, presence: true

  belongs_to :phone_model
  belongs_to :product

  def phone_ready_to_deliver
  	
  end
end
