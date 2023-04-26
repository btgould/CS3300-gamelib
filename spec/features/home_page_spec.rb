RSpec.feature "HomePages", type: :feature do
  scenario "The visitor should see games" do
    visit root_path
    expect(page).to have_text("Games")
  end
end
