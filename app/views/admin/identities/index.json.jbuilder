json.array!(@admin_identities) do |admin_identity|
  json.extract! admin_identity, :id
  json.url admin_identity_url(admin_identity, format: :json)
end
