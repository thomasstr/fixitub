class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => true
  
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
