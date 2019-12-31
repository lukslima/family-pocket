class IncomeAndUpdateAccount < SimpleDelegator
  def initialize(income_params)
    @income = Income.new(income_params)
    super(@income)
  end

  def save
    if @income.save
      update_account
      true
    else
      false
    end
  end

  private

  def update_account
    account = @income.account
    account.amount += @income.value
    account.save
  end
end
