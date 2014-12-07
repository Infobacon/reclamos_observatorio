json.array!(@diccionarios) do |diccionario|
  json.extract! diccionario, :id, :Terminos
  json.url diccionario_url(diccionario, format: :json)
end
