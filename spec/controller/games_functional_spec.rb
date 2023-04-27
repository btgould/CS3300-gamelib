require "rails_helper"

RSpec.describe GamesController, :type => :controller do
  describe "test web requests" do
    context "GET #index" do
      it "returns a success response" do
      get :index
      expect(response).to have_http_status(:ok)
      end
    end

    context "GET #show" do
      let!(:game) { Game.create(title: "Title", genre: "Genre", price: 30.0, interest: 8, description: "Content of the description") }
      it "returns a success response" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "GET #edit a nonexistent project" do
      it "raises an error" do
        expect{get :edit, params: {"id": 9999999}}.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
