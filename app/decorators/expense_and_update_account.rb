class ExpenseAndUpdateAccount < SimpleDelegator
  def initialize(expense_params)
    @expense = Expense.new(expense_params)
    super(@expense)
  end

  def save
    if @expense.save
      update_account
      true
    else
      false
    end
  end

  private

  def update_account
    account = @expense.account
    account.amount -= @expense.value
    account.save
  end
end
