Given(/^I have authorization$/) do
  User.last.authorized_applications == true
end

When(/^I create a new appointment$/) do
  # @schedule_block = Factory(:schedule_block)
  # @appointment = @schedule_block.appointments.new
  #should we just work with defauts or is this where factoryGirl comes in?
end

Then(/^the appointment should have an intial status of "(.*?)"$/) do |arg1|
  @appointment.status == arg1
end

Then(/^the appointment should have a schedule_block_id$/) do
  @appointment.schedule_block_id.exists? == true
end

Then(/^the appointment should have an attendee_id$/) do
  @appointment.attendee_id.exists? == true
end

Then(/^the appointment should be saved to the database$/) do
  @appointment.save!
end

Given(/^There is an existing appointment$/) do
  @appointment.exists? == true
end

When(/^I read an appointment$/) do
  @appointment = Appointment.find()
end

Then(/^the requested values should be returned$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I update an appointment$/) do
  #do want to include the values as part of the tests? best way to provide values?
  @appointment.save(values)
end

Then(/^TheDoctor should be notified of the changed status$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^TheDoctor should be notified of the updated fields$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I delete a document$/) do
  Appointment.destroy(@appointment.id)
end

Given(/^There is an existing appointment$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^TheDoctor should be notified of the changed status code$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a 'no authorized application' error message$/) do
  pending # express the regexp above with the code you wish you had
end