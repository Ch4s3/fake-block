json.array!(@blocks) do |block|
  json.extract! block, :id, :body, :user_id
  json.url block_url(block, format: :json)
end
