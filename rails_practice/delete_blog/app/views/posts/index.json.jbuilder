json.array!(@posts) do |post|
  json.extract! post, :id, :subject, :body, :published
  json.url post_url(post, format: :json)
end
