class Category < ActiveRecord::Base
  attr_accessible :c_name
  validates_presence_of :c_name
  validates :c_name, :uniqueness => true
  has_many :products
end
