ActiveAdmin.register Meeting.includes(:location) do
  permit_params :name, :start_date, :duration, :notes, :conference_link, :group_resources, :location_id, :language,
                :slug, :day, :visible, :status, :start_time_hour, :start_time_minute
  index do
    selectable_column
    column :id
    column 'Name' do |m|
      link_to m.name, admin_meeting_path(m)
    end
    tag_column :status
    column :visible
    column :slug
    column :location, sortable: false
    column 'Country' do |m|
      m.location.country_common_name
    end
    column 'Time Zone' do |m|
      m.location.timezone_name
    end
    column 'Start Time' do |m|
      m.start_date.strftime('%H:%M')
    end
    column :duration
    column 'Day' do |m|
      m.start_date.strftime('%A')
    end
    column 'Language' do |m|
      m.language.titleize
    end
    column :start_date
  end

  form do |_f|
    inputs do
      semantic_errors
      input :name, as: :string
      input :slug
      input :location_id, as: :search_select, url: admin_locations_path, fields: %i[name country city],
                          display_name: 'name', minimum_input_length: 0
      input :start_date, as: :date_time_picker
      input :duration, as: :number
      input :notes
      input :conference_link, as: :url
      input :group_resources
      input :language
      input :status
      input :visible
      actions
    end
  end
end
