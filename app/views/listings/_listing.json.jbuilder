json.extract! listing, :id, :name, :property_type, :room_number, :bed_number, :guest_number, :country, :state, :city, :city, :zipcode, :address, :price, :description, :created_at, :updated_at
json.url listing_url(listing, format: :json)


