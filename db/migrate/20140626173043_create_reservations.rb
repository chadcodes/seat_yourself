class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :restaurant
      t.belongs_to :user
      t.integer :guests
      t.datetime :date
      t.integer :time_slot

      t.timestamps
    end
  end
end
