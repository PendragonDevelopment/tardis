FactoryGirl.define do
	  
  factory :schedule_block do
    host_id 1
    event_id 1
    location_id 1
    start_time DateTime.now + 1
    end_time DateTime.now + 3
    reservation_min 2
    reservation_max 10
    status :open
  end

end