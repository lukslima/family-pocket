class DashboardController < ApplicationController
  def index
    @accounts = Account.unless_cards
    @total_amount = Account.unless_cards.total_amount

    @budgets = Budget.all
    @total_budget = Budget.total
  end
end
