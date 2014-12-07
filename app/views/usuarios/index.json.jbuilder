json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :nick, :nombre_u, :id_t
  json.url usuario_url(usuario, format: :json)
end
