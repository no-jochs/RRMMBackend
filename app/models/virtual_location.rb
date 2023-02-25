class VirtualLocation < Location
  NAME_STRING = 'Online'.freeze
  SLUG_STRING = 'online'.freeze

  validate :assure_no_online_record, on: [:create]
  validate :assure_one_online_record, on: [:destroy]

  def self.create!
    instance = find_or_initialize_by(name: NAME_STRING, slug: SLUG_STRING)
    return false if instance.persisted?

    instance.save!
  end

  def self.record
    all.first
  end

  private

  def assure_no_online_record
    single_record = self.class.record
    errors.add(:exists, "Only one #{self.class.name} can be created") if single_record
    errors.add(:name, :not_unique) if single_record && single_record.name == NAME_STRING
    errors.add(:slug, :not_unique) if single_record && single_record.slug == SLUG_STRING
    true
  end

  def assure_one_online_record
    records = find_all_by_name_and_slug(NAME_STRING, SLUG_STRING)
    errors.add(:cannot_destroy, "One #{self.class.name} must always exist") if records.count == 1
    true
  end
end

VirtualLocation.create!
