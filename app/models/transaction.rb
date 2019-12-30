class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  after_initialize :after_initialize

  validates :account, presence: true
  validates :category, presence: true
  validates :value, presence: true
  validates :date, presence: true

  scope :latest_first, -> { order(date: :desc) }

  def after_initialize
    self.date ||= Date.today if new_record?
  end
end
