class UserSerializer
  include JSONAPI::Serializer
  attributes :email
  attributes :api_key
end
