require "rails_helper"

describe "Game Attribute Requirements", :type => :model do
  context "Game Create" do
    it "should ensure the title is present" do
      game = Game.new(genre: "Genre", price: 30.0, interest: 8, description: "Content of the description")
      expect(game.valid?).to eq(false)
    end

    it "should ensure the genre is present" do
      game = Game.new(title: "Title", price: 30.0, interest: 8, description: "Content of the description")
      expect(game.valid?).to eq(false)
    end

    it "should ensure the price is present" do
      game = Game.new(title: "Title", genre: "Genre", interest: 8, description: "Content of the description")
      expect(game.valid?).to eq(false)
    end

    it "should ensure the price is positive" do
      game = Game.new(title: "Title", genre: "Genre", price: -10.0, interest: 8, description: "Content of the description")
      expect(game.valid?).to eq(false)
    end

    it "should ensure the interest level is present" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, description: "Content of the description")
      expect(game.valid?).to eq(false)
    end

    it "should ensure the interest level is at least 1" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 0, description: "Content of the description")
      expect(game.valid?).to eq(false)
    end

    it "should ensure the interest level it no more than 10" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 11, description: "Content of the description")
      expect(game.valid?).to eq(false)
    end

    it "should succeed for valid attributes" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 8, description: "Content of the description")
      expect(game.valid?).to eq(true)
    end

    it "should succeed for valid attributes (with no desc.)" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 8)
      expect(game.valid?).to eq(true)
    end
  end

  context "Game Save" do
    it "should ensure the title is present" do
      game = Game.new(genre: "Genre", price: 30.0, interest: 8, description: "Content of the description")
      expect(game.save).to eq(false)
    end

    it "should ensure the genre is present" do
      game = Game.new(title: "Title", price: 30.0, interest: 8, description: "Content of the description")
      expect(game.save).to eq(false)
    end

    it "should ensure the price is present" do
      game = Game.new(title: "Title", genre: "Genre", interest: 8, description: "Content of the description")
      expect(game.save).to eq(false)
    end

    it "should ensure the price is positive" do
      game = Game.new(title: "Title", genre: "Genre", price: -10.0, interest: 8, description: "Content of the description")
      expect(game.save).to eq(false)
    end

    it "should ensure the interest level is present" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, description: "Content of the description")
      expect(game.save).to eq(false)
    end

    it "should ensure the interest level is at least 1" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 0, description: "Content of the description")
      expect(game.save).to eq(false)
    end

    it "should ensure the interest level it no more than 10" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 11, description: "Content of the description")
      expect(game.save).to eq(false)
    end

    it "should succeed for valid attributes" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 8, description: "Content of the description")
      expect(game.save).to eq(true)
    end

    it "should succeed for valid attributes (with no desc.)" do
      game = Game.new(title: "Title", genre: "Genre", price: 30.0, interest: 8)
      expect(game.save).to eq(true)
    end
  end

  context "Edit game" do
    before (:each) do
      @game = Game.create(title: "Title", genre: "Genre", price: 30.0, interest: 8, description: "Content of the description")
    end

    it "should update title when valid update given" do
      @game.update(:title => "New Title")
      expect(@game.title == "New Title")
    end

    it "should preserve old title when invalid update given" do
      @game.update(:title => "")
      expect(@game.title == "Title")
    end

    it "should update genre when valid update given" do
      @game.update(:genre => "New Genre")
      expect(@game.genre == "New Genre")
    end

    it "should preserve old genre when invalid update given" do
      @game.update(:genre => "")
      expect(@game.genre == "Genre")
    end

    it "should update price when valid update given" do
      @game.update(:price => 40.0)
      expect(@game.price == 40.0)
    end

    it "should preserve old price when invalid update given" do
      @game.update(:price => -10.0)
      expect(@game.price == 30.0)
    end

    it "should update interest when valid update given" do
      @game.update(:interest => 9)
      expect(@game.interest == 9)
    end

    it "should preserve old interest when invalid update given" do
      @game.update(:interest => -10)
      expect(@game.interest == 8)
    end

    it "should update description" do
      @game.update(:description => "New Desc")
      expect(@game.description == "New Desc")
    end
  end
end
