json.array!(@filtros) do |filtro|
  json.extract! filtro, :id, :tipo, :termino
  json.url filtro_url(filtro, format: :json)
end
