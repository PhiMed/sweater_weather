class BackgroundSerializer
  include JSONAPI::Serializer
  attributes :location,
             :img_url,
             :credit
end
