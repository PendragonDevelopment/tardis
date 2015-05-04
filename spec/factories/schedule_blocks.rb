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
    event_id 1
    start_time DateTime.now + 1
    end_time DateTime.now + 3
    reservation_min 2
    reservation_max 10
    status :open
  end

end
