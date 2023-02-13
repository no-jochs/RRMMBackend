class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :street_address_1, :street_address_2, :city, :state_providence, :country,
             :country_common_name, :postal_code, :formatted_address, :time_zone, :utc_offset, :latitude, :longitude, :notes, :venue_type,
             :status, :created_at, :updated_at
end
