json.array!(@campers) do |camper|
  json.extract! camper, :user_id, :name, :age, :gender, :picked_up
  json.url camper_url(camper, format: :json)
end
