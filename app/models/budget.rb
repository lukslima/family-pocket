class Budget < ApplicationRecord
  belongs_to :category

  scope :total, -> { sum(:value) }
  scope :fixed, -> { where(is_fixed: true) }
  scope :not_fixed, -> { where(is_fixed: false) }

  def spend(month)
    category.transactions.by_month(month).sum(:value)
  end

  def situation_color(month)
    return 'green' if good?(month)
    return 'yellow' if warning?(month)
    return 'red' if bad?(month)
  end

  def good?(month)
    spend(month) < partial_budget
  end

  def warning?(month)
    spend(month).between?(partial_budget, pluss_ten_percent)
  end

  def bad?(month)
    spend(month) > pluss_ten_percent
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
