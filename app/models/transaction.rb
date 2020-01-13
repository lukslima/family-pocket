class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  after_initialize :after_initialize

  validates :account, presence: true
  validates :category, presence: true
  validates :value, presence: true
  validates :date, presence: true

  scope :latest_first, -> { order(date: :desc) }

  scope :from_date_month, lambda { |date|
    between_dates(date.at_beginning_of_month, date.at_end_of_month)
  }

  scope :between_dates, lambda { |first_day, last_day|
    where('date >= ? AND date <= ?', first_day, last_day)
  }

  def after_initialize
    self.date ||= Date.today if new_record?
  end
end
