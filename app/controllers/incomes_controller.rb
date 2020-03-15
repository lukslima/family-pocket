class IncomesController < ApplicationController
  before_action :set_income

  has_scope :from_date_month, default: Date.today.to_s do |_controller, scope, value|
    scope.from_date_month(value.to_date)
  end

  def index
    @transactions = apply_scopes(Income).all
  end

  def create
    @income = build_income

    respond_to do |format|
      if @income.save
        flash[:notice] = 'Income was successfully created.'
        format.js
        format.html { redirect_to @income }
        format.json { render :show, status: :created, location: @income }
      else
        format.html { render :new }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @income.update(income_params)
        format.js
        format.html { redirect_to transactions_path, notice: 'Income was successfully updated.' }
        format.json { render :show, status: :ok, location: @income }
      else
        format.html { render :edit }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_income
    @income = Income.find(params[:id])
  end

  def build_income
    IncomeAndUpdateAccount.new(income_params)
  end

  def income_params
    params.require(:income).permit(:value, :date, :account_id, :category_id, :description)
  end
end
