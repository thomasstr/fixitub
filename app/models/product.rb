class Product < ActiveRecord::Base
  attr_accessible :p_about, :p_anr, :p_name, :p_price, :category_id, :stock
  validates_presence_of :p_name, :uniqueness => true
  validates_presence_of :p_anr, :uniqueness => true
  belongs_to :category
  
  has_attached_file :avatar, :styles => {
    :thumb => "110x110#",
    :small  => "150x150>",
    :medium => "300x300>" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
end
