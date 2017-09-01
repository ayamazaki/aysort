json.extract! user, :id, :name, :email, :value1, :value2, :value3, :created_at, :updated_at
json.url user_url(user, format: :json)
