class ScheduleBlock < ActiveRecord::Base
	enum status: [ :open, :full, :reserve_not_met, :cancelled, :restricted]
end
