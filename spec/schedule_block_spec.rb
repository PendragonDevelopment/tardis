require 'spec_helper'

class ScheduleBlock
end

describe ScheduleBlock do

  describe "#create" do

    it "should have a host_id" do 
    end

    it "should have a start time" do 
    end

    it "should have an end time" do 
    end

    it "should have a reservation minimum" do 
    end

    it "should a reservation maximum" do 
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