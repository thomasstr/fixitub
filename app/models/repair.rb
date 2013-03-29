#encoding: utf-8
class Repair < ActiveRecord::Base
  attr_accessible :email, :name, :phone_model, :phone_model_id, :product_id, :product_name, :free_text, :delivered, :ready

  validates :email, :name, :phone_model_id, :product_id, presence: true

  validates :free_text, length: {maximum: 160}

  validate :expiration_date_cannot_be_in_the_past
  
  belongs_to :phone_model
  belongs_to :product

  def expiration_date_cannot_be_in_the_past
  	if !ready.blank? and ready < Date.today
  		errors.add(:ready, "Kan ikke være i fortid")
  	end
  end
end
