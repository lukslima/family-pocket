class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :category
  after_initialize :after_initialize

  def after_initialize
    self.date ||= Date.today if new_record?
  end
end
