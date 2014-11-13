Given (/^I am on the homepage$/) do
  visit '/'            #capybara syntax
  #save_and_open_file   launchy syntax
end

When (/^I register to play the game$/) do 
  fill_in 'player_name', with: 'Ben'
  click_button 'Register'
end

Then (/^I should wait for another player to join$/) do 
  expect(page).to have_content "Wait for next player, Ben!"
end


Then(/^I should be asked to enter some ships$/) do
  expect(page).to have_content("please enter the coordinates and orientation of the ships you wish to place")
end

Given(/^I have registered$/) do
  visit '/'
  step("I register to play the game")
end

Given(/^I have entered my ships$/) do
  fill_in 'ship_one', with: 'a1'
  select('vertical', :from => 'ship_one_orientation')

  fill_in 'ship_two', with: 'b1'
  select('vertical', :from => 'ship_two_orientation')

  fill_in 'ship_three', with: 'c1'
  select('vertical', :from => 'ship_three_orientation')

  fill_in 'ship_four', with: 'a1'
  select('vertical', :from => 'ship_four_orientation')

  fill_in 'ship_five', with: 'e1'
  select('vertical', :from => 'ship_five_orientation')

  click_button 'Place Ships'
end
