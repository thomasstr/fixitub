class Product < ActiveRecord::Base
  include Sprockets::Helpers::RailsHelper
  include Sprockets::Helpers::IsolatedHelper
  #rolify
  #helper_method :check_qty
  attr_accessible :p_about, :p_anr, :p_name, :p_price, :category_id, :stock, :avatar, :qty
  validates_presence_of :p_name
  validates_uniqueness_of :p_name, :p_anr unless :nil
  belongs_to :category

  has_many :repairs
  
  has_attached_file :avatar, :styles => {
    :thumb => "110x110#",
    :small  => "150x150>",
    :medium => "300x300>" },
    :url  => "/assets/products/:id/:style/:basename.:extension",
    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
    
    def check_qty
      if qty.nil?
        return 0;
      else
        return qty
      end
    end

    def prod_count
      @product = product.qty.size
    end
    
    def admin_qty_instock
      if qty.nil?
        return "Nei"
      else
        return "Ja"
      end
    end
    
    def qty_instock
      if qty.nil?
        return image_tag("not_in_stock.jpg")
      else
        return image_tag("in_stock.gif")
      end
    end
    
    def image_exists
      if avatar.exists?
        return image_tag(avatar.url(:thumb), :class => "pull-left")
      else
        return image_tag("missing.png", :class => "pull-left")
      end
    end
    
    def update_inventory
      #Product.where().destroy
    end
    
    def chart_data(start = 3.weeks.ago)
      total_prices = prices_by_day(start)
      download_prices = prices_by_day = prices_by_day(start)
      (start.to_date..Date.today).map do |date|
        {
          created_at: date,
          price: total_prices[date] || 0,
          download_price: download_prices[date] || 0
        }
      end
    end
    
    def prices_by_day(start)
      products = where(created_at: start.beginning_of_day..Time.zone.now)
      products = products.group("date(created_at)")
      products = products.select("created_at, sum(p_price) as total_price")
      products.each_with_object({}) do |products, prices|
        prices[products.created_at.to_date] = products.total_price
      end
    end
    
end