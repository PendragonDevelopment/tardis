require 'doorkeeper/grape/helpers'

class API < Grape::API
  prefix 'api'
  version 'v1'
  format :json
  helpers Doorkeeper::Grape::Helpers

  before do
    doorkeeper_authorize!
  end

  resource :schedule_blocks do
    desc "Returns a list of Schedule Blocks"
    get do
      @schedule_blocks = ScheduleBlock.all
      return @schedule_blocks.to_json
    end

    desc "Creates a new Schedule Block with the given parameters"
    post do
      @schedule_block = ScheduleBlock.new(params)
      if @schedule_block.save  
        return  @schedule_block.to_json
      else 
        return "Error!!!!!!!!!"
      end
    end

    desc "Returns the Schedule Block with the given ID"
    get ":id" do
      @schedule_block = ScheduleBlock.find(params[:id])
      return @schedule_block.to_json
    end

    desc "Updates the Schedule Block with the given ID"
    put ":id" do
      @schedule_block = ScheduleBlock.find(params[:id])
      @schedule_block.update_attributes(params)
      return @schedule_block.to_json
    end

    desc "Deletes the Schedule Block with the given ID"
    delete ":id" do
      @schedule_block = ScheduleBlock.find(params[:id]).destroy
      return "Schedule Block deleted"
    end

    desc "Returns a list of Appointments for a given Schedule Block"
    get ":id/appointments" do
      @schedule_block = ScheduleBlock.find(params[:id])
      @appointments = @schedule_block.appointments
      return @appointments.to_json
    end

    desc "Creates a new Appointment with the given parameters for a given Schedule Block"
    post ":id/appointments" do
      @schedule_block = ScheduleBlock.find(params[:id])
      @appointment = @schedule_block.appointments.create(params)
      return @appointment.to_json
    end

    desc "Returns the Appointment with the given ID for a given Schedule Block"
    get ":id/appointments/:apt_id" do
      @schedule_block = ScheduleBlock.find(params[:id])
      @appointment = @schedule_block.appointments.find(params[:id])
      return @appointment.to_json
    end
  end

  resource :appointments do
    desc "Updates the appointment with the given ID"
    put ":id" do
      @appointment = Appointment.find(params[:id])
      if @appointment.update_attributes(params)
        return @appointment.to_json
      else
        return "There was an error updating the appointment."
      end
    end

    desc "Deletes the Appointment with the given ID"
    delete ":id" do
      @appointment = Appointment.find(params[:id]).destroy
      return "Appointment destroyed.  Utterly."
    end

    desc "Returns a list of all appointments"
    get do
      @appointments = Appointment.all
      return @appointments.to_json
    end
  end

  resource :search do
    desc "Expects a list of filter params and returns a response of appointments that match"   
    get "appointments" do
      @appointments = Appointment.where("attendee = ?", params[:attendee])
      return appointments.to_json
    end

    desc "Expects a list of filter params and returns a response of schedule_blocks that match"
    get "schedule_blocks" do
      @schedule_blocks = ScheduleBlock.where("host_id = ?", params[:host_id])
      return @schedule_blocks.to_json
    end
  end

end
