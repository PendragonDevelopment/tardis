FactoryGirl.define do 
  factory :schedule_block do 
    host_id "1"
    start_time "9:00"
    end_time "10:00"
    reservation_min "1"
    reservation_max "4"
  end
end
