class Admin::ItemsController < ApplicationController
  
  def index
    @items = Iuems.all
  end
  
end
