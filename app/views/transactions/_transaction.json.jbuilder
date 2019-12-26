json.extract! transaction, :id, :value, :date, :account_id, :category_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
