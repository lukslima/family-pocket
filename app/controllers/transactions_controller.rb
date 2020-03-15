class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  
  has_scope :by_account
  has_scope :by_category
  has_scope :by_type
  has_scope :by_year, default: '2020'
  has_scope :by_month, default: Date.today.month.to_s

  def index
    @transactions = apply_scopes(Transaction).latest_first
  end

  def new
    @expense = Expense.new
    @income = Income.new
  end

  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:value, :date, :account_id, :category_id, :description)
  end
end
