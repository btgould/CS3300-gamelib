require "rails_helper"

RSpec.describe "/games", type: :request do
    let(:valid_attributes) {
      {title: "Title", genre: "Genre", price: 30.0, interest: 8, description: "Description"}
    }
  
    let(:invalid_attributes) {
      {title: "", genre: "", price: -1.0, interest: 11, description: "Description"}
    }

    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
    end
  
    describe "GET /index" do
      it "renders a successful response" do
        Game.create! valid_attributes
        get games_url
        expect(response).to be_successful
      end
    end
  
    describe "GET /show" do
      it "renders a successful response" do
        article = Game.create! valid_attributes
        get game_url(article)
        expect(response).to be_successful
      end
    end
  
    describe "GET /new" do
      it "renders a successful response" do
        get new_game_url
        expect(response).to be_successful
      end
    end
  
    describe "GET /edit" do
      it "render a successful response" do
        game = Game.create! valid_attributes
        get edit_game_url(game)
        expect(response).to be_successful
      end
    end
  
    describe "POST /create" do
      context "with valid parameters" do
        it "creates a new Game" do
          expect {
            post games_url, params: { game: valid_attributes }
          }.to change(Game, :count).by(1)
        end
  
        it "redirects to the created article" do
          post games_url, params: { game: valid_attributes }
          expect(response).to redirect_to(game_url(Game.last))
        end
      end
  
      context "with invalid parameters" do
        it "does not create a new Game" do
          expect {
            post games_url, params: { game: invalid_attributes }
          }.to change(Game, :count).by(0)
        end
  
        it "responds that the content cannot be processed" do
          post games_url, params: { game: invalid_attributes }
          expect(response.status).to eq(422)
        end
      end
    end
  
    describe "PATCH /update" do
      context "with valid parameters" do
        let(:new_attributes) {
          {title: "New Title", genre: "New Genre", price: 40.0, interest: 9, description: "New Description"}
        }
  
        it "updates the requested game" do
          game = Game.create! valid_attributes
          patch game_url(game), params: { game: new_attributes }
          game.reload

          expect(game.title).to eq("New Title")
          expect(game.genre).to eq("New Genre")
          expect(game.price).to eq(40.0)
          expect(game.interest).to eq(9)
          expect(game.description).to eq("New Description")
        end
  
        it "redirects to the game" do
          game = Game.create! valid_attributes
          patch game_url(game), params: { game: new_attributes }
          game.reload
          expect(response).to redirect_to(game_url(game))
        end
      end
  
      context "with invalid parameters" do
        it "responds that the content cannot be processed" do
          game = Game.create! valid_attributes
          patch game_url(game), params: { game: invalid_attributes }
          expect(response.status).to eq(422)
        end
      end
    end
  
    describe "DELETE /destroy" do
      it "destroys the requested game" do
        game = Game.create! valid_attributes
        expect {
          delete game_url(game)
        }.to change(Game, :count).by(-1)
      end
  
      it "redirects to the games list" do
        game = Game.create! valid_attributes
        delete game_url(game)
        expect(response).to redirect_to(games_url)
      end
    end
  end
  