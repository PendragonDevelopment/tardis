Given(/^I do not have an authorized application$/) do
  User.last.authorized_applications == false
end

When(/^I create a new schedule block$/) do
  @schedule_block = User.schedule_blocks.new
end

Then(/^I see a no authorized application error message$/) do
  @schedule_block.exists? == false
end