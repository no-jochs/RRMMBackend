class AddNotNullConstraintToTypeColumnOnLocations < ActiveRecord::Migration[7.0]
  def up
    Location.where(type: nil).update_all!(type: 'PhysicalLocation')
    change_column_null :locations, :type, false
  end

  def down
    change_column_null :locations, :type, true
  end
end
