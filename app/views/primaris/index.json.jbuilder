json.array!(@primaris) do |primari|
  json.extract! primari, :id
  json.url primari_url(primari, format: :json)
end
