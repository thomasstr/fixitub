class StaticPagesController < ApplicationController
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
    @categories = Category.all()

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: [@products, @categories] }
      format.xml { render xml: [ @products ] }
    end  
  end
  
  def contact
  end
  
  def about
    @employee = Employee.all
    
    respond_to do |format|
      format.html
      format.json { render json: @employee }
    end
  end
  
end
