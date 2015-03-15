require 'rails_helper'

RSpec.describe ScheduleBlock, type: :model do
  describe "#create" do

    it "should have a host_id" do 
      expect(@schedule_block.host_id).to be_true
    end

    it "should have a start time" do 
      expect(@schedule_block.start_time).to be_true
    end

    it "should have an end time" do 
      expect(@schedule_block.end_time).to be_true
    end

    it "should have a reservation minimum" do
      expect(@schedule_block.reservation_min).to be_true
    end

    it "should have a reservation maximum" do 
      expect(@schedule_block.reservation_max).to be_true
    end

  end

  describe "#delete" do 

    it "should set associated appointments status' to 'cancelled'" do
      expect(@schedule_block.status).to eq('Cancelled')
    end

  end

  describe "#update" do 

    it "should save the new parameters in the DB" do
      expect(@schedule_block[:params]).to eq('?')
    end

    it "should change all associated appointments" do
      expect(@scheule_block.appointments).to 
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
