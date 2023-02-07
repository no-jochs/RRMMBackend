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
    column 'Start Time' do |meeting|
      t = Time.new(2000, 1, 1, meeting.start_time_hour, meeting.start_time_minute)
      t.to_fs(:time)
    end
    column :duration
    column 'Day' do |m|
      m.day.titleize
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
      input :start_date, as: :date_time_picker,
                         picker_options: { format: 'm/d/Y', min_date: Date.current, timepicker: false }
      input :day
      input 'Start Time', label: 'Start Hour (24hr)'
      input :start_time_minute, label: 'Start Minute'
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
