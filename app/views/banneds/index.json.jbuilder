json.array!(@banneds) do |banned|
  json.extract! banned, :id, :name, :protected_camper, :camper
  json.url banned_url(banned, format: :json)
end
