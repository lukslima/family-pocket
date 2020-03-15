class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  after_initialize :after_initialize

  validates :account, presence: true
  validates :category, presence: true
  validates :value, presence: true
  validates :date, presence: true

  scope :total, -> { sum(:value) }
  scope :latest_first, -> { order(date: :desc) }
  scope :by_description, ->(description) { where(description: description) }
  scope :by_category, ->(category_id) { where(category_id: category_id) }
  scope :by_account, ->(account_id) { where(account_id: account_id) }
  scope :by_type, ->(type) { where(type: type) }

  scope :from_date_month, lambda { |date|
    between_dates(date.at_beginning_of_month, date.at_end_of_month)
  }

  scope :by_month, ->(month) { where('extract(month from date) = ?', month) }
  scope :by_year, ->(year) { where('extract(year from date) = ?', year) }

  scope :between_dates, lambda { |first_day, last_day|
    where('date >= ? AND date <= ?', first_day, last_day)
  }

  def after_initialize
    self.date ||= Date.today if new_record?
  end
end
