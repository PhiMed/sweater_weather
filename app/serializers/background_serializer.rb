class BackgroundSerializer
  include JSONAPI::Serializer
  attributes :location,
             :img_url,
             :source,
             :author
end
