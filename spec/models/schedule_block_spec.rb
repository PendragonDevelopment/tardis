require 'spec_helper'

class ScheduleBlock
end

describe ScheduleBlock do
  let(:schedule_block)  { FactoryGirl.create :schedule_block }

  describe "#create" do

    it "should have a hostId" do 
      expect(schedule_block.hostId).to eq('1')
    end

    it "should have a startTime" do 
      expect(schedule_block.startTime).to eq('2015-03-12 13:18:30')
    end

    it "should have an endTime" do 
      expect(schedule_block.endTime).to eq('2015-03-12 13:18:30')
    end

    it "should have a reservationMin" do
      expect(schedule_block.reservationMin).to eq('1')
    end

    it "should have a reservationMax" do 
      expect(schedule_block.reservationMax).to eq('1')
    end

  end

  describe "#delete" do 

    it "should set associated appointments status' to 'cancelled'" do
      expect(@schedule_block.status).to eq('Cancelled')
    end

  end

  describe "#update" do 

    it "should save the new parameters in the DB" do
      @schedule_block.update(start_time: '10:00', end_time: "11:00")
      expect(@schedule_block.reload.start_time).to eql('10:00')
      expect(@schedule_block.reload.end_time).to eql('11:00')
    end

    it "should change all associated appointments" do
      @schedule_block.appointments.each do |appointment|
        appointment.start_time.update_attributes(start_time: '10:00')
      end
      expect(@schedule_block.appointments.each.start_time).to eql('10:00')
    end

    it "should notify the Doctor of the appropriate status code and updated information" do
      expect(@schedule_block.notify_doctor).to be_tru
    end

  end

  describe "#access" do 

    it "should return the requested values" do
      # Can you have multiple expects in an it method block? Two thoughts crossed my mind here: 1) use multiple expect lines for each possible value or use one expect line with some sort of call to params...
    end

  end

  describe "Appointment#delete" do

    it "should verify ScheduleBlock status" do
      expect(@schedule_block.status).to 
    end

    it "should update ScheduleBlock status if necessary" do
      expect(@schedule_block.status).to 
    end

  end

end