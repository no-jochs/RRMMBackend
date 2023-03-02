ActiveAdmin.register Venue.includes(:meetings) do
  permit_params :name, :notes, :latitude, :longitude, :street_address_1, :street_address_2, :city, :country, :state_providence,
                :postal_code, :slug, :venue_type, :time_zone, :status

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
      l.time_zone
    end
  end

  form do |_f|
    inputs do
      semantic_errors
      input :name
      input :slug
      input :country
      input :state_providence
      input :city
      input :street_address_1
      input :street_address_2
      input :postal_code
      input :latitude
      input :longitude
      input :time_zone
      input :venue_type
      input :status
      input :notes
      actions
    end
  end
end
