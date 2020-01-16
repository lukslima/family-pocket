class DashboardController < ApplicationController
  has_scope :from_date_month, default: Date.today

  def index
    @total_income = apply_scopes(Income.total)
    @total_expense = apply_scopes(Expense.total)

    @accounts = Account.unless_cards
    @total_amount = Account.unless_cards.total_amount

    @budgets = Budget.all
    @total_budget = Budget.total
  end
end
