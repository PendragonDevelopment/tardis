Given(/^I have authorization$/) do
  User.last.authorized_applications == true
end

When(/^I create a new appointment$/) do
  @schedule_block = FactoryGirl.create(:schedule_block)
  @appointment = FactoryGirl.create(:appointment)
  @appointment.schedule_block_id = @schedule_block.id
end

Then(/^the appointment should have an intial status of pending$/) do
  @appointment.status == "pending"
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
  @found_appointment = Appointment.find(@appointment.id)
end

Then(/^the requested values should be returned$/) do
  @found_appointment == @appointment
end

When(/^I update an appointment$/) do
  @appointment.status = "booked"
  @appointment.save!
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
  @appointment.exists? == true
end

Then(/^TheDoctor should be notified of the changed status code$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a 'no authorized application' error message$/) do
  pending # express the regexp above with the code you wish you had
end