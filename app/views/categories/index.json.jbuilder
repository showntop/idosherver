json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :parent_id, :logo_url, :background_url
  json.url category_url(category, format: :json)
end
