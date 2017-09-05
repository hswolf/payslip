require 'rails_helper'

RSpec.feature 'Users can calculate payslip by inputting data in fields' do
  scenario "with valid attributes" do
    visit '/'

    fill_in "payslip_first_name", with: "Vinh"
    fill_in "Last name", with: "To"
    fill_in "Annual salary", with: 60050
    fill_in "Super rate", with: 9
    fill_in "Payment start date", with: '01/03/2017'
    fill_in "Payment end date", with: '31/03/2017'
    click_button "Calculate"

    expect(page).to have_content "Payslip is generated successfully."
  end
end