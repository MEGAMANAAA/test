json.array!(@camps) do |camp|
  json.extract! camp, :id, :name, :theme, :price, :min_age, :max_age, :reg_limit, :enrolled
  json.url camp_url(camp, format: :json)
end
