class MeetingSerializer < ActiveModel::Serializer
  belongs_to :location
  attributes :id, :name, :start_date, :duration, :notes, :conference_link, :group_resources, :location_id, :language,
             :slug, :visible, :status, :created_at, :updated_at
end
