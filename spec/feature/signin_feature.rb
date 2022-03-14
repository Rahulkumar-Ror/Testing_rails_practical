require "rails_helper"

feature "User signs in" do
  given!(:user) { FactoryBot.create(:user) }

  scenario "with valid credentials" do
    visit user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    check "Remember me"
    click_button "Log in"
    expect(page).to have_content "Signed in successfully."
  end
end
