class IncomesController < ApplicationController
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

  private

  def build_income
    IncomeAndUpdateAccount.new(income_params)
  end

  def income_params
    params.require(:income).permit(:value, :date, :account_id, :category_id, :description)
  end
end
