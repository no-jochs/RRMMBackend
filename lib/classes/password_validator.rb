class PasswordValidator < ActiveModel::Validator
  def validate(record)
    record.errors.add(:password, 'must not be blank') && return if record.password.nil? || record.password.blank?

    record.errors.add(:password, 'must be at least 12 characters') if record.password.length < 12

    record.errors.add(:password, 'must contain at least 1 uppercase letter') unless record.password.match(/[A-Z]/)

    record.errors.add(:password, 'must contain at least 1 lowercase letter') unless record.password.match(/[a-z]/)

    return if record.password.match(/[0-9]/)

    record.errors.add(:password, 'must contain at least 1 digit')
  end
end
