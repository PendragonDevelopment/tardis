Given(/^I do not have an authorized application$/) do
  User.last.authorized_applications == false
end

When(/^I create a new schedule block$/) do
  @schedule_block = User.schedule_blocks.new
end

Then(/^I see a no authorized application error message$/) do
  @schedule_block.exists? == false
end

Given(/^I am not logged in$/) do
  User.logged_in? == false
end

Then(/^I see a 'you must be logged in' error message$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am logged in$/) do
  User.logged_in? == true
end

When(/^I create a valid ScheduleBlock$/) do
  User.schedule_block.create(valid_params)
end

Then(/^I see a 'schedule block successfully created' message$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^The schedule block has a schedule_block_id$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have appropriate authorization$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I read an existing ScheduleBlock$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the requested values should be returned$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I update an existing ScheduleBlock$/) do
  User.schedule_block.update(valid_new_params)
end

Then(/^it should return the updated values$/) do
  User.schedule_block = valid_new_params
end

Then(/^TheDoctor should be notified of the status$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^TheDoctor should be notified of the updated values$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I delete an existing ScheduleBlock$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^TheDoctor should be notified of the changed status code$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^all attached appointments should also be deleted$/) do
  pending # express the regexp above with the code you wish you had
end
