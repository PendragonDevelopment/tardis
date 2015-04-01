# == Schema Information
#
# Table name: appointments
#
#  id                :integer          not null, primary key
#  schedule_block_id :integer
#  attendee          :integer
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
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

  factory :appointment do
    attendee 1
    status 1
  end
end
