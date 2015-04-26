# app/controllers/api/v1/base.rb
module API
  module V1
    class Base < Grape::API
      mount API::V1::Appointments
      mount API::V1::ScheduleBlocks
      mount API::V1::Search
    end
  end
end