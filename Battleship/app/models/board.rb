class Board < ApplicationRecord
  belongs_to :player, class_name: "User"
  belongs_to :game
  has_many :ships
end
