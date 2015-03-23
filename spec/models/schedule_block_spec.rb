require 'spec_helper'

describe ScheduleBlock do

  let(:schedule_block) { FactoryGirl.create :schedule_block }

  describe "#create" do
    it "should have a host_id" do
      expect(schedule_block.host_id).to eq(1)
    end

    it "should have a start time that is a valid DateTime object" do
      start_time = DateTime.parse(schedule_block.start_time.to_s)
      expect(start_time.is_a?(DateTime)).to be_truthy
    end

    it "should have an end time that is a valid DateTime object" do
      end_time = DateTime.parse(schedule_block.end_time.to_s)
      expect(end_time.is_a?(DateTime)).to be_truthy
    end

    it "should have a reservation min" do
      expect(schedule_block.reservation_min).to eq(1)
    end

    it "should have a reservation max" do
      expect(schedule_block.reservation_max).to eq(1)
    end

    it "should have a valid status type" do
      statuses = ['open', 'full', 'reserve_not_met', 'cancelled', 'restricted']
      expect(statuses.include?(schedule_block.status)).to be_truthy
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