json.array!(@user_lists) do |user_list|
  json.extract! user_list, :id, :status, :movie_id, :user_id
  json.url user_list_url(user_list, format: :json)
end
