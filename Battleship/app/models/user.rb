class User < ApplicationRecord
  has_secure_password
  has_many :hosted_games, class_name: "Game", foreign_key: :player1_id
  has_many :joined_games, class_name: "Game", foreign_key: :player2_id
  has_many :boards, foreign_key: :player_id
  has_many :ships, through: :boards

  def games_played
    self.hosted_games.length + self.joined_games.length
  end

  def games_lost
    self.games_played - self.wins
  end
end
