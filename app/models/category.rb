class Category < ApplicationRecord
  has_many :transactions
  
  enum kind: { income: 'Income', expense: 'Expense' }
end
