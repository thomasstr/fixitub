class Employee < ActiveRecord::Base
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  rolify
  attr_accessible :email, :name
  validates_presence_of :name
  
  validates :email, :format => { :with => %r{.+@.+\..+} }, :allow_blank => true
  
  has_attached_file :avatar, :styles => {
    :thumb => "150x150#" },
    :url  => "/assets/employees/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/employees/:id/:style/:basename.:extension"
    
    def image_exists
      if avatar.exists?
        return image_tag(avatar.url(:thumb))
      else
        return image_tag("missing.png")
      end
    end
    
end
