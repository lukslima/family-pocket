class ExpensesController < ApplicationController
  has_scope :from_date_month, default: Date.today.to_s do |_controller, scope, value|
    scope.from_date_month(value.to_date)
  end

  def index
    @transactions = apply_scopes(Expense).all
  end

  def create
    @expense = build_expense

    respond_to do |format|
      if @expense.save
        flash[:notice] = 'Expense was successfully created.'
        format.js
        format.html { redirect_to @expense }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { redirect_to new_transaction_path }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def build_expense
    ExpenseAndUpdateAccount.new(expense_params)
  end

  def expense_params
    params.require(:expense).permit(:value, :date, :account_id, :category_id, :description)
  end
end
