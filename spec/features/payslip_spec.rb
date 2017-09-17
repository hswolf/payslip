require 'rails_helper'

RSpec.feature 'Users can calculate payslip by inputting data in fields' do
  before do
    visit '/'
  end

  scenario "with valid attributes" do
    fill_in "First name", with: "Vinh"
    fill_in "Last name", with: "To"
    fill_in "Annual salary", with: 60050
    fill_in "Super rate", with: 9
    fill_in "Payment month", with: '03/2013'
    click_button "Calculate"

    expect(page).to have_content "Vinh To"
    expect(page).to have_content "March 2013"
    expect(page).to have_content "$5004"
    expect(page).to have_content "$922"
    expect(page).to have_content "$4082"
    expect(page).to have_content "$450"
  end

    scenario "with no attributes do" do
    click_button 'Calculate'

    expect(page).to have_content "can't be blank"
  end

  scenario "with invalid Annual Salary" do
    fill_in "Annual salary", with: 'foo'
    click_button 'Calculate'

    expect(page).to have_content "is not a number"
  end

  scenario "with invalid Super Rate" do
    fill_in "Super rate", with: 100
    click_button 'Calculate'

    expect(page).to have_content "must be less than or equal to 50"
  end

  scenario "with invalid Payment Month" do
    fill_in "Payment month", with: 'foo'
    click_button 'Calculate'

    expect(page).to have_content "can't be blank"
  end
end