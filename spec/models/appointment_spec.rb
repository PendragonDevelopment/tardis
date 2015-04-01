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

require 'rails_helper'

describe Appointment, type: :model do
  
  let(:schedule_block) {FactoryGirl.create(:schedule_block)}
  let(:appointment) {schedule_block.appointments.create(FactoryGirl.attributes_for(:appointment))}

  describe "Model attributes exist" do
  	subject {appointment}

  	it {is_expected.to respond_to(:id)}
  	it {is_expected.to respond_to(:schedule_block_id)}
  	it {is_expected.to respond_to(:attendee)}
  	it {is_expected.to respond_to(:status)}
  	it {is_expected.to respond_to(:created_at)}
  	it {is_expected.to respond_to(:updated_at)}

  	it {is_expected.to be_valid}
  end

  describe "validations" do
  	it "should be invalid with a blank schedule_block_id" do
  		appointment.schedule_block_id = nil
  		expect(appointment).not_to be_valid
  	end

  	it "should be invalid with a blank attendee" do
  		appointment.attendee = nil
  		expect(appointment).not_to be_valid
  	end

  	it "should be invalid with a nil status" do
  		appointment.status = nil
  		expect(appointment).not_to be_valid
  	end

  end
end
