# == Schema Information
#
# Table name: schedule_blocks
#
#  id              :integer          not null, primary key
#  host_id         :integer
#  event_id        :integer
#  location_id     :integer
#  start_time      :datetime
#  end_time        :datetime
#  reservation_min :integer          default(1)
#  reservation_max :integer
#  status          :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class ScheduleBlock < ActiveRecord::Base
  belongs_to :user

	has_many :appointments
  
	enum status: [ :open, :full, :reserve_not_met, :cancelled, :restricted]
end
