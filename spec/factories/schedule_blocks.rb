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