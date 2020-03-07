class DashboardController < ApplicationController
  has_scope :from_date_month, default: Date.today.to_s do |_controller, scope, value|
    scope.from_date_month(value.to_date)
  end

  def index
    @total_income = apply_scopes(Income.total)
    @total_expense = apply_scopes(Expense.total)

    @accounts = Account.unless_cards
    @total_amount = Account.unless_cards.total_amount

    @fixed_budgets = Budget.fixed
    @budgets = Budget.not_fixed
    @total_fixed_budget = Budget.fixed.total
    @total_budget = Budget.not_fixed.total
  end
end
