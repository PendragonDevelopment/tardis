class Appointment < ActiveRecord::Base
  belongs_to :schedule_block
  enum status: [:pending, :booked, :in_progress, :completed, :paid, :cancelled]

  validates :schedule_block_id, :attendee, :status, presence: true

end