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
		end

  
	  context 'unauthorized' do
		  describe 'GET #schedule_blocks' do
		  	it 'responds with 401' do
					get '/api/v1/schedule_blocks', :format => :json
		      expect(response.status).to eq(401)
				end
		  end

		  describe 'GET #schedule_block/:id' do
		  	let(:schedule_block) {FactoryGirl.create(:schedule_block)}

		  	it 'responds with 401' do
		  		get "/api/v1/schedule_blocks/#{schedule_block.id}", :format => :json
		  		expect(response.status).to eq(401)
		  	end
		  end
		end
	end

	describe 'appointments' do

		context 'authorized' do
			pending
		end

		context 'unauthorized' do
			pending
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