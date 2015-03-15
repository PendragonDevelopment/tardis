class Appointment < ActiveRecord::Base
  belongs_to :schedule_block
  enum status: [:pending, :booked, :in_progress, :completed, :paid, :cancelled]
end
