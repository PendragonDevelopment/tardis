class ScheduleBlock < ActiveRecord::Base
  belongs_to :user
	has_many :appointments
	enum status: [ :open, :full, :reserve_not_met, :cancelled, :restricted]

  validates :host_id, :event_id, :location_id, :start_time, :end_time, :reservation_min, :reservation_max, presence: true

  validates :status, inclusion: { in: %w(open full reserve_not_met cancelled restricted),
    message: "%{value} is not a valid Schedule Block status." }
end
