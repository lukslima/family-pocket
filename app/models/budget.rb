class Budget < ApplicationRecord
  belongs_to :category

  scope :total, -> { sum(:value) }

  def spend
    category.transactions.sum(:value)
  end

  def situation_color
    return 'green' if good?
    return 'yellow' if warning?
    return 'red' if bad?
  end

  def good?
    spend < less_ten_percent
  end

  def warning?
    spend.between?(less_ten_percent, pluss_ten_percent)
  end

  def bad?
    spend > pluss_ten_percent
  end

  def less_ten_percent
    partial_budget - ten_percent
  end

  def pluss_ten_percent
    partial_budget + ten_percent
  end

  def ten_percent
    partial_budget * (10 / 100.to_f)
  end

  def partial_budget
    day = Date.today.day
    value / 30 * day
  end
end
