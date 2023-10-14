class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find([:id])
  end

end
