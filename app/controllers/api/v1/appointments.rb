module API
	module V1
		class Appointments < Grape::API

			include API::V1::Defaults

			before do
		  	doorkeeper_authorize!
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

		  private

	  	def appointment_params(params)
			  params
			end
		end
	end
end