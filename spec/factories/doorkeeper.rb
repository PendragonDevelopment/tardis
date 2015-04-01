FactoryGirl.define do

	factory :oauth_application, :class => Doorkeeper::Application do
	  sequence(:name) { |n| "application_name_#{n}" }
	  redirect_uri 'https://localhost:3000/'
	end 

	factory :oauth_token, :class => Doorkeeper::AccessToken do
	  association :application, :factory => :oauth_application
	  association :resource_owner_id, :factory => :user
	end 
end