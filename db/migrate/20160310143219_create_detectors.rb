class CreateDetectors < ActiveRecord::Migration[5.0]
  def change
    create_table :detectors do |t|
      t.string :name
      t.string :serial_number
      t.string :detector_type
      t.string :token
      t.string :owner
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end
  end
end
