json.array!(@reclamos) do |reclamo|
  json.extract! reclamo, :id, :Tweet_id, :Compania_id, :tipo, :servicio
  json.url reclamo_url(reclamo, format: :json)
end
