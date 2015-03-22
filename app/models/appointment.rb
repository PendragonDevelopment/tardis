# == Schema Information
#
# Table name: appointments
#
#  id                :integer          not null, primary key
#  schedule_block_id :integer
#  attendee          :integer
#  status            :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Appointment < ActiveRecord::Base
  belongs_to :schedule_block
  
  enum status: [:pending, :booked, :in_progress, :completed, :paid, :cancelled]
end
