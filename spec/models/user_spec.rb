# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#
require 'rails_helper'

describe User, type: :model do

  let(:user) { FactoryGirl.create(:user) }

  subject { user }

  it { should respond_to(:email) }
  it { should respond_to(:name) }

  it "#email returns a string" do
    expect(user.email).to include("@example.com")
  end

end
