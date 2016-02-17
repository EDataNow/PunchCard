json.array!(@workplaces) do |workplace|
  json.extract! workplace, :id, :shift_id, :location_id
  json.url workplace_url(workplace, format: :json)
end
