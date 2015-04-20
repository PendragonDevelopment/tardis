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

FactoryGirl.define do
	  
	factory :schedule_block do
    host_id 1
    event_id 1
    location_id 1
    start_time "2015-10-10 10:00"
    end_time "2015-10-10 11:00"
    reservation_min 1
    reservation_max 1
    status :open
  end

end
