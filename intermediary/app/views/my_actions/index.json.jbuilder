json.array!(@my_actions) do |my_action|
  json.extract! my_action, :id, :name, :url, :active, :provider_id
  json.url my_action_url(my_action, format: :json)
end
