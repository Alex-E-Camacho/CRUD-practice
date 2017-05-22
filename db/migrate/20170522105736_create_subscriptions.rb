class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :channel, null: false
      t.references :user, null: false

      t.timestamps(null: false)
    end
  end
end
