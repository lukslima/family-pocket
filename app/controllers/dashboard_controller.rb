class DashboardController < ApplicationController
  def index
    @accounts = Account.all
    @total_amount = Account.total_amount
    
    @budgets = Budget.all
    @total_budget = Budget.total
  end
end
