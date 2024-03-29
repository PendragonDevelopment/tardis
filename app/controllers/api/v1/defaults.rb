require 'doorkeeper/grape/helpers'

# app/controllers/api/v1/defaults.rb
module API
  module V1
    module Defaults
      # if you're using Grape outside of Rails, you'll have to use Module#included hook
      extend ActiveSupport::Concern

      included do
        # common Grape settings
        version 'v1'
        format :json

        helpers Doorkeeper::Grape::Helpers

        # global handler for simple not found case
        rescue_from ActiveRecord::RecordNotFound do |e|
          error_response(message: e.message, status: 404)
        end

        # global exception handler, used for error notifications
        rescue_from :all do |e|
          if Rails.env.development?
            raise e
          else
            error_response(message: "Internal server error: #{e}", status: 500)
          end
        end
      end
    end
  end
end