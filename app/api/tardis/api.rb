class API < Grape::API
  prefix 'api'
  version 'v1'
  format :json

  resource :schedule_blocks do
    desc "Returns a list of Schedule Blocks"
    get do
    end

    desc "Creates a new Schedule Block with the given parameters"
    post do
    end

    desc "Returns the Schedule Block with the given ID"
    get ":id" do
    end

    desc "Updates the Schedule Block with the given ID"
    put ":id" do
    end

    desc "Deletes the Schedule Block with the given ID"
    delete ":id" do
    end

    desc "Returns a list of Appointments for a given Schedule Block"
    get ":id/appointments" do
    end

    desc "Creates a new Appointment with the given parameters for a given Schedule Block"
    post ":id/appointments" do
    end

    desc "Returns the Appointment with the given ID for a given Schedule Block"
    get ":id/appointments/:apt_id" do
    end
  end

  resource :appointments do
    desc "Updates the appointment with the given ID"
    put ":id" do
    end

    desc "Deletes the Appointment with the given ID"
    delete ":id" do
    end

    desc "Returns a list of all appointments"
    get do
    end
  end

  resource :search do
    desc "Expects a list of filter params and returns a response of objects that match"
    post do
    end
  end

end