Given(/^I do not have an authorized application$/) do
  User.last.authorized_applications == false
end

When(/^I create a new schedule block$/) do
  @schedule_block = User.schedule_blocks.new
end

Then(/^I see a no authorized application error message$/) do
  @schedule_block.exists? == false
end

Given(/^I am a signed in user$/) do
  @user.logged_in?
end

Given(/^I have no existing schedule blocks$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I make a new schedule block$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I should have (\d+) schedule block$/) do |arg1|
  migrated the test db and made some schedule block feature_steps
end