class Account < ApplicationRecord
  scope :total_amount, -> { sum(:amount) }
  scope :cards_only, -> { where(is_card: true) }
  scope :unless_cards, -> { where(is_card: false) }
end
