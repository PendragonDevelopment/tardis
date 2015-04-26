require 'rails_helper'

describe API do

	let!(:user) {FactoryGirl.create(:user)}
	let!(:appplication) {FactoryGirl.create(:oauth_application)}
	let!(:oauth_token) {FactoryGirl.create(:oauth_token)}
	
	describe 'schedule_blocks' do

		context 'authorized' do
			
		  describe 'GET #schedule_blocks' do
		    it 'responds with 200' do
		    	get '/api/v1/schedule_blocks', :format => :json, :access_token => oauth_token.token
		      expect(response.status).to eq(200)
		    end
		  end

		  describe 'GET #schedule_block/:id' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}

		  	it 'responds with 200' do
		  		get "/api/v1/schedule_blocks/#{schedule_block.id}", :format => :json, :access_token => oauth_token.token
		  		expect(response.status).to eq(200)
		  	end
		  end

		  describe 'POST #schedule_block' do
		  	let(:sb_params) {FactoryGirl.attributes_for(:schedule_block)}

		  	it 'responds with 200' do
		  		sb_params[:access_token] = oauth_token.token
		  		post "/api/v1/schedule_blocks", :format => :json, :schedule_block => sb_params
		  		expect(response.status).to eq(200)
		  	end
		  end

		  describe 'PUT #schedule_block/:id' do
		  	pending
		  end

		  describe 'DELETE #schedule_block/:id' do
		  	let(:new_schedule_block) {FactoryGirl.create(:schedule_block)}

		  	it 'responds with 200' do
			  	delete "/api/v1/schedule_blocks/#{new_schedule_block.id}", :format => :json, :access_token => oauth_token.token
			  	expect(response.status).to eq(200)
			  end
		  end

		  describe 'GET #schedule_blocks/:id/appointments' do
		  	let(:new_schedule_block) {FactoryGirl.create(:schedule_block)}

				it 'responds with 200' do
					get "/api/v1/schedule_blocks/#{new_schedule_block.id}/appointments", :format => :json, :access_token => oauth_token.token
					expect(response.status).to eq(200)
				end
		  end

		  describe 'GET #schedule_blocks/:id/appointments/:apt_id' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}
				let(:new_appointment) { schedule_block.appointments.new(FactoryGirl.attributes_for(:appointment))}

				it 'responds with 200' do
					get "/api/v1/schedule_blocks/#{schedule_block.id}/appointments/#{new_appointment.id}", :format => :json, :access_token => oauth_token.token
					expect(response.status).to eq(200)
				end
		  end

		  describe 'POST #schedule_blocks/:id/appointments' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}
		  	let(:appt_params) {FactoryGirl.attributes_for(:appointment)}

		  	it 'responds with 200' do
		  		appt_params[:access_token] = oauth_token.token
		  		post "/api/v1/schedule_blocks", :format => :json, :schedule_block => appt_params
		  		expect(response.status).to eq(200)
		  	end
		  end

		end

  
	  context 'unauthorized' do

		  describe 'GET #schedule_blocks' do
		  	it 'responds with 401' do
					get '/api/v1/schedule_blocks', :format => :json, :access_token => nil
		      expect(response.status).to eq(401)
				end
		  end

		  describe 'GET #schedule_block/:id' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}

		  	it 'responds with 401' do
		  		get "/api/v1/schedule_blocks/#{schedule_block.id}", :format => :json, :access_token => nil
		  		expect(response.status).to eq(401)
		  	end
		  end

		  describe 'POST #schedule_block' do
		  	let(:sb_params) {FactoryGirl.attributes_for(:schedule_block)}

		  	it 'responds with 401' do
		  		post "/api/v1/schedule_blocks", :schedule_block => sb_params
		  		expect(response.status).to eq(401)
		  	end
		  end

		  describe 'PUT #schedule_block/:id' do
		  	pending
		  end

		  describe 'DELETE #schedule_block/:id' do
		  	let(:new_schedule_block) {FactoryGirl.create(:schedule_block)}

		  	it 'responds with 401' do
			  	delete "/api/v1/schedule_blocks/#{new_schedule_block.id}", :format => :json
			  	expect(response.status).to eq(401)
			  end
		  end

		  describe 'GET #schedule_blocks/:id/appointments' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}

				it 'responds with 401' do
					get "/api/v1/schedule_blocks/#{schedule_block.id}/appointments", :format => :json, :access_token => oauth_token.token
					expect(response.status).to eq(401)
				end
		  end

		  describe 'GET #schedule_blocks/:id/appointments/:apt_id' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}
				let(:new_appointment) { schedule_block.appointments.new(FactoryGirl.attributes_for(:appointment))}

				it 'responds with 401' do
					get "/api/v1/schedule_blocks/#{schedule_block.id}/appointments/#{new_appointment.id}", :format => :json, :access_token => oauth_token.token
					expect(response.status).to eq(401)
				end
		  end

		  describe 'POST #schedule_blocks/:id/appointments' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}
		  	let(:appt_params) {FactoryGirl.attributes_for(:appointment)}

		  	it 'responds with 401' do
		  		appt_params[:access_token] = oauth_token.token
		  		post "/api/v1/schedule_blocks", :format => :json, :schedule_block => appt_params
		  		expect(response.status).to eq(401)
		  	end
		  end

		end
	end

	describe 'appointments' do

		context 'authorized' do
			describe 'GET #appointments' do
				it 'responds with 200' do
		    	get '/api/v1/appointments', :format => :json, :access_token => oauth_token.token
		      expect(response.status).to eq(200)
		    end
			end

			describe 'DELETE #appointments/:id' do
				let(:schedule_block) {FactoryGirl.create(:schedule_block)}
				let(:new_appointment) { schedule_block.appointments.new(FactoryGirl.attributes_for(:appointment))}

				it 'responds with 200' do
					delete "/api/v1/appointments/#{new_appointment.id}", :format => :json, :access_token => oauth_token.token
					expect(response.status).to eq(200)
				end
			end
		end

		context 'unauthorized' do
			describe 'GET #appointments' do
				it 'responds with 401' do
		    	get '/api/v1/appointments', :format => :json
		      expect(response.status).to eq(401)
		    end
			end

			describe 'DELETE #appointments/:id' do
				let(:schedule_block) {FactoryGirl.create(:schedule_block)}
				let(:new_appointment) { schedule_block.appointments.new(FactoryGirl.attributes_for(:appointment))}

				it 'responds with 401' do
					delete "/api/v1/appointments/#{new_appointment.id}", :format => :json
					expect(response.status).to eq(401)
				end
			end
		end

	end

	describe 'search' do
		context 'authorized' do
			pending
		end

		context 'unauthorized' do
			pending
		end
	end
end