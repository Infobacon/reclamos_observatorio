json.array!(@compania) do |companium|
  json.extract! companium, :id, :nombre_c, :cuenta, :twi
  json.url companium_url(companium, format: :json)
end
