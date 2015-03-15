class ScheduleBlock < ActiveRecord::Base
  belongs_to :user
	has_many :appointments
	enum status: [ :open, :full, :reserve_not_met, :cancelled, :restricted]
end
