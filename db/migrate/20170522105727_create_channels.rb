class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :callsign, null: false, unique: true
      t.string :name, null: false, unique: true
      t.decimal :price_per_month, null: false

      t.timestamps(null: false)
    end
  end
end
