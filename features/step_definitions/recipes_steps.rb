Given(/^I am a guest$/) do

end

When(/^I visit the home page$/) do
  visit '/#/'
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  expect(page).to have_content('Recipes')
end

Given(/^I am a logged in user$/) do
  @user = FactoryGirl.create(:user)
  visit '/#/'
  click_on "Log in"
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  find('#login-button').click
end

When(/^I create a new Recipe$/) do
  @recipe = FactoryGirl.build(:recipe)
  visit '/#/recipes/new'
  fill_in "Title", with: @recipe.title
  fill_in "Description", with: @recipe.description
  fill_in "recipe-ingredient", with: "Sugar \n"
  fill_in "recipe-direction", with: "Pour it \n"
  click_on "Create Recipe"
end

Then(/^I should see the new Recipe$/) do
  expect(page).to have_content(@recipe.title)
  expect(page).to have_content(@recipe.description)
  expect(page).to have_content("Sugar")
end

Given(/^there are (\d+) Recipes$/) do |arg1|
  @user = FactoryGirl.create(:user)
  arg1.to_i.times do
    @recipe = FactoryGirl.create(:recipe, user: @user)
  end
end

Then(/^I should see (\d+) Recipes$/) do |arg1|
  expect(page).to have_selector('.col-md-4', count: arg1.to_i)
end

When(/^I look at a recipe$/) do
  @user = FactoryGirl.create(:user)
  @recipe = FactoryGirl.create(:recipe, user: @user)

  visit "/#/recipes/#{@recipe.id}"
end

Then(/^I should see the Recipe$/) do
  expect(page).to have_content(@recipe.title)
  expect(page).to have_content(@recipe.description)
end

When(/^edit a recipe$/) do
  @recipe = FactoryGirl.create(:recipe, user: @user)
  visit "/#/recipes/#{@recipe.id}/edit"
  fill_in "Title", with: "Updated"
  click_on "Update Recipe"
end

Then(/^I should see the new recipe data$/) do
  expect(page).to have_content "Updated"
end

When(/^I delete a recipe$/) do
  @recipe = FactoryGirl.create(:recipe, user: @user)
  visit "/#/recipes/#{@recipe.id}"
  click_on "Delete"
end

Then(/^I should not see the recipe title$/) do
  expect(page).not_to have_content @recipe.title
end

When(/^I search for a recipe$/) do
  @user = FactoryGirl.create(:user)
  @recipe = FactoryGirl.create(:recipe, user: @user)

  visit '/#/'
  fill_in 'search_term', with: @recipe.title
  click_on 'search-button'
end

Then(/^I should see the recipe title$/) do
  expect(page).to have_content @recipe.title
  expect(page).to have_content "Recipe's including:"
end
