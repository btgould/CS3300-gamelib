RSpec.feature "Games", type: :feature do
    context "Update game" do
      let(:game) { Game.create(title: "Title", genre: "Genre", price: 30.0, interest: 8, description: "Content of the description") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_game_path(game)
      end

      scenario "should succeed when new title is valid" do 
        within("form") do
          fill_in "Title", with: "New title"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end

      
      scenario "should fail when new title is empty" do
        within("form") do
          fill_in "Title", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Title can't be blank")
      end

      scenario "should succeed when new genre is valid" do 
        within("form") do
          fill_in "Genre", with: "New genre"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end

      
      scenario "should fail when new genre is empty" do
        within("form") do
          fill_in "Genre", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Genre can't be blank")
      end

      scenario "should succeed when new price is valid" do 
        within("form") do
          fill_in "Price", with: 40.0
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end

      scenario "should fail when new price is empty" do
        within("form") do
          fill_in "Price", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Price is not a number")
      end

      scenario "should fail when new price is negative" do
        within("form") do
          fill_in "Price", with: -10.0
        end
        click_button "Update Game"
        expect(page).to have_content("Price must be greater than or equal to 0")
      end

      scenario "should succeed when new interest is valid" do 
        within("form") do
          fill_in "Interest", with: 9
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end

      scenario "should fail when new interest is empty" do
        within("form") do
          fill_in "Interest", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Interest is not a number")
      end

      scenario "should fail when new interest is above range" do
        within("form") do
          fill_in "Interest", with: 11
        end
        click_button "Update Game"
        expect(page).to have_content("Interest must be less than 11")
      end

      scenario "should fail when new interest is below range" do
        within("form") do
          fill_in "Interest", with: 0
        end
        click_button "Update Game"
        expect(page).to have_content("Interest must be greater than 0")
      end

      scenario "should succeed when giving new description" do 
        within("form") do
          fill_in "Description", with: "New description"
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end

      scenario "should succeed when giving blank description" do 
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Game"
        expect(page).to have_content("Game was successfully updated")
      end
      
    end
  end