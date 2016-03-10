class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.integer :detector_id
      t.timestamp :detected_at
      t.text :event_data_base64
      t.decimal :latitude
      t.decimal :longitude
      t.timestamps
    end
  end
end
