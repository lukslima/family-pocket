class Account < ApplicationRecord
  scope :total_amount, -> { all.sum(:amount) }
end
