class Admin::CustomersController < ApplicationController

  def index
    @customers = Customers.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

end
