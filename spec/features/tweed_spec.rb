require 'rails_helper'

describe 'the tweed process' do

  it 'adds a new tweed', js: true do
    user = FactoryGirl.create(:user)
    login(user)
    visit root_path
    click_on 'Tweedify'
    fill_in "Body", with: "I am addicted to 2048."
    click_on "Don Tweed"
    expect(page).to have_content "addicted"
    expect(page).not_to have_content "Don Tweed"
    expect(page).to have_content "Tweedify"
  end

  it 'deletes tweed', js: true do
    user = FactoryGirl.create(:user)
    tweed = FactoryGirl.create(:tweed, user: user)
    login(user)
    visit root_path
    click_on "delete"
    save_screenshot('screenshot.png')
    expect(page).not_to have_content tweed.body
  end

end
