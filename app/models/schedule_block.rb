class ScheduleBlock < ActiveRecord::Base
  belongs_to :user
	has_many :appointments
	enum status: [ :open, :full, :reserve_not_met, :cancelled, :restricted]

  validates :host_id, :event_id, :location_id, :start_time, :end_time, :reservation_min, :reservation_max, presence: true

  validates :status, inclusion: { in: %w(open full reserve_not_met cancelled restricted), message: "%{value} is not a valid Schedule Block status." }

  # validate :start_time_is_a_date_time, :end_time_is_a_date_time

  # Supposed to validate that end_time is after start_time
  # validates :end_time, numericality: { :greater_than => :start_time }

  # def start_time_is_a_date_time
  #  start_time = DateTime.parse(:start_time.to_s)
  #  errors.add(:start_time, "is not a valid DateTime") unless start_time.is_a?(DateTime) 
  #end

  #def end_time_is_a_date_time
  #  end_time = :end_time.to_s
  #  end_time = DateTime.parse(end_time)
  #  errors.add(:end_time, "is not a valid DateTime") unless end_time.is_a?(DateTime) 
  #end

end
