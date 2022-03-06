class SessionSerializer
  include JSONAPI::Serializer
  set_type :id
  set_type "users"
  attributes :email,
             :api_key
end
