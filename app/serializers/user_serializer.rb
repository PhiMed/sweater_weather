class UserSerializer
  include JSONAPI::Serializer
  attributes :email
  attributes :password_digest
  attributes :api_key
end
