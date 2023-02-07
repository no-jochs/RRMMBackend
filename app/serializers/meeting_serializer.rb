class MeetingSerializer < ActiveModel::Serializer
  belongs_to :location
  attributes :id, :name, :start_date, :duration, :notes, :conference_link, :group_resources, :location_id, :language,
             :slug, :day, :visible, :status, :start_time_hour, :start_time_minute, :created_at, :updated_at
end
