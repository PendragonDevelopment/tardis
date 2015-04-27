# app/controllers/api/base.rb
module API
  class Base < Grape::API
    mount API::V1::Base
    add_swagger_documentation base_path: '/api',
                              api_version: 'v1'

  end
end