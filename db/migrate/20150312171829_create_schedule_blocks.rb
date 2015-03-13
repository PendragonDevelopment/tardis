class CreateScheduleBlocks < ActiveRecord::Migration
  def change
    create_table :schedule_blocks do |t|
      t.integer :host_id
      t.integer :event_id
      t.integer :location_id
      t.datetime :start_time
      t.datetime :end_time
      t.integer :reservation_min, default: 1
      t.integer :reservation_max
      t.integer :status, default: 0, null: false  

      t.timestamps null: false
    end
  end
end
