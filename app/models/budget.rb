class Budget < ApplicationRecord
  belongs_to :category

  scope :total, -> { all.sum(:value) }

  def spend
    category.transactions.sum(:value)
  end
end
