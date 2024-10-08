class SlugValidator < ActiveModel::Validator
  def validate(record)
    return true if record.slug.match(/^[a-z0-9][-_a-z0-9]*[a-z0-9]$/)

    record.errors.add(:slug, "#{record.slug} slug is unsafe.")
  end
end
