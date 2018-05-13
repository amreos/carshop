json.extract! listing, :id, :title, :img_url, :make, :model, :mpg, :price, :registered, :created_at, :updated_at
json.url listing_url(listing, format: :json)
