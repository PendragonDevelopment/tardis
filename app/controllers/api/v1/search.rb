module API
  module V1
    class Search < Grape::API
			
			include API::V1::Defaults

			before do
		  	doorkeeper_authorize!
		  end

		  resource :search do
		    desc "Expects a list of filter params and returns a response of appointments that match"
		    get "appointments" do
		      content_type "application/json"
		      @appointments = Appointment.where("attendee = ?", params[:attendee])
		      return appointments.as_json
		    end

		    desc "Returns all of the Schedule Blocks attached to the given Event Id"
		    get "schedule_blocks" do
		    	content_type "application/json"
		    	@schedule_blocks = ScheduleBlock.where("event_id = ?", params[:event_id])
		    	return @schedule_blocks.as_json
		    end
		  end
    end
  end
end