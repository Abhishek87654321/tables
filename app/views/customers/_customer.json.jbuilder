json.extract! customer, :id, :name, :age, :city, :gender, :created_at, :updated_at
json.url customer_url(customer, format: :json)
