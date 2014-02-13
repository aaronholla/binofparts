json.array!(@requests) do |request|
  json.extract! request, :id, :part_id, :year, :qty, :event_id, :team_id
  json.url request_url(request, format: :json)
end
