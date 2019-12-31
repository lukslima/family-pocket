class DashboardController < ApplicationController
  def index
    @accounts = Account.all
    @total_amount = Account.total_amount
  end
end
