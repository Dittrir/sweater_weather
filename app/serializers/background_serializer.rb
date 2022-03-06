class BackgroundSerializer
  include JSONAPI::Serializer
  set_type "image"
  set_type :id
  attributes :image
end
