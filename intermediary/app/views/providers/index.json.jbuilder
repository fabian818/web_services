json.array!(@providers) do |provider|
  json.extract! provider, :id, :name, :url, :token
  json.url provider_url(provider, format: :json)
end
