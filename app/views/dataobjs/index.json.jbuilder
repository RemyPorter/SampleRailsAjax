json.array!(@dataobjs) do |dataobj|
  json.extract! dataobj, :id, :name, :description
  json.url dataobj_url(dataobj, format: :json)
end
