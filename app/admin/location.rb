ActiveAdmin.register Location.includes(:meetings) do
  permit_params :name, :notes, :latitude, :longitude, :street_address_1, :street_address_2, :city, :country, :state_providence,
                :postal_code, :slug, :venue_type, :timezone_identifier, :status

  index do
    selectable_column
    column :id
    column 'Name' do |l|
      link_to l.name, admin_location_path(l)
    end
    column 'Meetings' do |l|
      l.meetings.count
    end
    tag_column :venue_type
    column :slug
    column 'Country' do |l|
      l.country_common_name
    end
    column :state_providence
    column :city
    column :postal_code
    column 'Timezone' do |l|
      l.timezone_name
    end
  end
end
