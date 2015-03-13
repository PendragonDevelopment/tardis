class ScheduleBlock < ActiveRecord::Base
	has_many :appointments
	enum status: [ :open, :full, :reserve_not_met, :cancelled, :restricted]
end
