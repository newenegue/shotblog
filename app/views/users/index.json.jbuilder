json.array!(@users) do |user|
  json.extract! user, :id, :user_name, :first_name, :last_name, :email, :blog_name
  json.url user_url(user, format: :json)
end
