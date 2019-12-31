class Category < ApplicationRecord
  enum kind: { income: 'Income', expense: 'Expense' }
end
