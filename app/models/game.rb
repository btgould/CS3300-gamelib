class Game < ApplicationRecord
    validates :title, :genre, presence: true
    validates :price, numericality: { greater_than_or_equal_to: 0 }
    validates :interest, numericality: { only_integer: true, greater_than: 0, less_than: 11 }
end
