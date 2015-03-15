class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :schedule_block, index: true
      t.integer :attendee
      t.integer :status

      t.timestamps null: false
    end
    add_foreign_key :appointments, :schedule_blocks
  end
end
