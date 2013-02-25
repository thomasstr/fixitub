class StaticPagesController < ApplicationController
  respond_to :html, :json
  
  def home
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def repairs
    @products = Product.all(:order => 'id DESC')
    #@products = Product.search params[:search]
    #@categories = Category.all()

    respond_to do |format|
      format.html # index.html.erb
      format.json
      format.xml
    end  
  end
  
  def contact
  end
  
  def about
    @users = User.all(:conditions => {:roles => :admin})
    
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end
  
end
