require 'spec_helper'

describe ScheduleBlock do

  let(:schedule_block) { FactoryGirl.create :schedule_block }

  describe "#create" do
    it "should have a host_id" do
      expect(schedule_block.host_id).to eq(1)
    end

    it "should have a start time" do
      expect(schedule_block.start_time).to eq("2015-10-10 10:00:00")
    end

    it "should have an end time" do
      expect(schedule_block.end_time).to eq("2015-10-10 11:00:00")
    end

    it "should have a reservation min" do
      expect(schedule_block.reservation_min).to eq(1)
    end

    it "should have a reservation max" do
      expect(schedule_block.reservation_max).to eq(1)
    end

  end

  describe "#delete" do

    it "should set associated appointments status' to 'cancelled'" do
    end

  end

  describe "#update" do

    it "should save the new parameters in the DB" do
    end

    it "should change all associated appointments" do
    end

    it "should notify the Doctor of the appropriate status code and updated information" do
    end

  end

  describe "#access" do

    it "should return the requested values" do
    end

  end

  describe "Appointment#delete" do

    it "should verify ScheduleBlock status" do
    end

    it "should update ScheduleBlock status if necessary" do
    end

  end

end