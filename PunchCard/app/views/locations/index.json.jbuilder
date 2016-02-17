json.array!(@locations) do |location|
  json.extract! location, :id, :name, :address, :shift_start, :shift_end
  json.url location_url(location, format: :json)
end
