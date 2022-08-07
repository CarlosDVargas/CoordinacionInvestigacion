json.extract! transaction, :id, :agreementNumber, :status, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
