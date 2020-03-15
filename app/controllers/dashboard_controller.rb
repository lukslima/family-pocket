class DashboardController < ApplicationController
  has_scope :by_year, default: '2020'
  has_scope :by_month, default: Date.today.month.to_s

  def index
    @total_income = apply_scopes(Income).total
    @total_expense = apply_scopes(Expense).total

    @accounts = Account.unless_cards
    @total_amount = Account.unless_cards.total_amount

    @fixed_budgets = Budget.fixed
    @budgets = Budget.not_fixed
    @total_fixed_budget = Budget.fixed.total
    @total_budget = Budget.not_fixed.total

    @month = params[:by_month]
  end
end
