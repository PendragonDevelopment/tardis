require 'doorkeeper/grape/helpers'

class API < Grape::API
  prefix 'api'
  version 'v1'
  format :json
  helpers Doorkeeper::Grape::Helpers

  before do
    doorkeeper_authorize!
  end

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  resource :schedule_blocks do
    desc "Returns a list of Schedule Blocks"
    get do
      content_type "application/json"
      @schedule_blocks = ScheduleBlock.all
      return @schedule_blocks.as_json
    end

    desc "Creates a new Schedule Block with the given parameters"
    post do
      sanitized_params = schedule_block_params(params)
      content_type "application/json"
      @schedule_block = ScheduleBlock.new(sanitized_params)
      if @schedule_block.save
        return  @schedule_block.as_json
      else
        return "Error!!!!!!!!!"
      end
    end

    desc "Returns the Schedule Block with the given ID"
    get ":id" do
      content_type "application/json"
      @schedule_block = ScheduleBlock.find(params[:id])
      return @schedule_block.as_json
    end

    desc "Updates the Schedule Block with the given ID"
    put ":id" do
      sanitized_params = schedule_block_params(params)
      content_type "application/json"
      @schedule_block = ScheduleBlock.find(sanitized_params[:id])
      @schedule_block.update_attributes(sanitized_params)
      return @schedule_block.as_json
    end

    desc "Deletes the Schedule Block with the given ID"
    delete ":id" do
      content_type "application/json"
      @schedule_block = ScheduleBlock.find(params[:id]).destroy
      return "Schedule Block deleted"
    end

    desc "Returns a list of Appointments for a given Schedule Block"
    get ":id/appointments" do
      content_type "application/json"
      @schedule_block = ScheduleBlock.find(params[:id])
      @appointments = @schedule_block.appointments
      return @appointments.as_json
    end

    desc "Creates a new Appointment with the given parameters for a given Schedule Block"
    post ":id/appointments" do
      sanitized_params = appointment_params(params)
      content_type "application/json"
      @schedule_block = ScheduleBlock.find(sanitized_params[:id])
      @appointment = @schedule_block.appointments.create(sanitized_params)
      return @appointment.as_json
    end

    desc "Returns the Appointment with the given ID for a given Schedule Block"
    get ":id/appointments/:apt_id" do
      content_type "application/json"
      @schedule_block = ScheduleBlock.find(params[:id])
      @appointment = @schedule_block.appointments.find(params[:id])
      return @appointment.as_json
    end
  end

  resource :appointments do
    desc "Updates the appointment with the given ID"
    put ":id" do
      sanitized_params = appointment_params(params)
      content_type "application/json"
      @appointment = Appointment.find(sanitized_params[:id])
      if @appointment.update_attributes(sanitized_params)
        return @appointment.as_json
      else
        return "There was an error updating the appointment."
      end
    end

    desc "Deletes the Appointment with the given ID"
    delete ":id" do
      content_type "application/json"
      @appointment = Appointment.find(params[:id]).destroy
      return "Appointment destroyed.  Utterly."
    end

    desc "Returns a list of all appointments"
    get do
      content_type "application/json"
      @appointments = Appointment.all
      return @appointments.as_json
    end
  end

  resource :search do
    desc "Expects a list of filter params and returns a response of appointments that match"
    get "appointments" do
      content_type "application/json"
      @appointments = Appointment.where("attendee = ?", params[:attendee])
      return appointments.as_json
    end

    desc "Expects a list of filter params and returns a response of schedule_blocks that match"
    get "schedule_blocks" do
      content_type "application/json"
      @schedule_blocks = ScheduleBlock.where("host_id = ?", params[:host_id])
      return @schedule_blocks.as_json
    end
  end

private

def schedule_block_params(params)
  params do
    requires :host_id         , type:Integer
    requires :event_id        , type: Integer
    requires :location_id     , type: Integer
    requires :start_time      , type: Datetime
    requires :end_time        , type:Datetime
    requires :reservation_min , type:Integer
    requires :reservation_max , type:Integer
    requires :status          , type:Integer
    requires :user_id         , type:Integer
  end
end

def appointment_params(params)
  params do
    requires :schedule_block_id ,type: Integer
    requires :attendee          ,type: Integer
    requires :status            ,type: Integer
  end
end
