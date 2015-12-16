json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :has_secure_password
  json.url user_url(user, format: :json)
end
