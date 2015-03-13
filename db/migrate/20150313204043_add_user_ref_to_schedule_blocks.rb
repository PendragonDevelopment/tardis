class AddUserRefToScheduleBlocks < ActiveRecord::Migration
  def change
    add_reference :schedule_blocks, :user, index: true
    add_foreign_key :schedule_blocks, :users
  end
end
