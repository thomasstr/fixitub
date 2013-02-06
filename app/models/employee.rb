class Employee < ActiveRecord::Base
  attr_accessible :email, :name
  validates_presence_of :name
  
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  has_attached_file :avatar, :styles => {
    :thumb => "150x150#" },
    :url  => "/assets/employees/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/employees/:id/:style/:basename.:extension"
end
