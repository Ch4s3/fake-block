json.array!(@blocks) do |block|
  json.extract! block, :id, :slab, :usr_id
  json.url block_url(block, format: :json)
end
