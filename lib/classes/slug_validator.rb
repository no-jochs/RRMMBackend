class SlugValidator < ActiveModel::Validator
  def validate(record)
    return true if record.url_slug.match(/^[a-z0-9][-_a-z0-9]*[a-z0-9]$/)

    record.errors.add(:url_slug, "#{record.url_slug} slug is unsafe.")
  end
end
