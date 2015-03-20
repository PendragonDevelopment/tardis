class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :oauth_applications, class_name: 'Doorkeeper::Application', as: :owner
  has_many :schedule_blocks
end
