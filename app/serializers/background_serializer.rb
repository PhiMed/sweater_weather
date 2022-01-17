class BackgroundSerializer
  include JSONAPI::Serializer
  attributes :id,
             :location,
             :img_url,
             :credit
end
