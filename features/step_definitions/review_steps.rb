Given(/^there is a Recipe$/) do
  @user = FactoryGirl.create(:user)
  @recipe = FactoryGirl.create(:recipe, user: @user)
end

When(/^I visit the Recipe$/) do
  visit "/#/recipes/#{@recipe.id}"
end

When(/^I create an invalid review$/) do
  fill_in "comment", with: "My Review"
  click_on "create_review"
end

Then(/^I should see the review error message$/) do
  expect(page).to have_content("between 1 and 5")
end
