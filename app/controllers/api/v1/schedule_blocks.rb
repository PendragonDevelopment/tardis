module API
	module V1
		class ScheduleBlocks < Grape::API

			include API::V1::Defaults

			before do
		  	doorkeeper_authorize!
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
		end
	end
end