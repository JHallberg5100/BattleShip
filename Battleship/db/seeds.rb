# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create({username: "admin", email: "p@p.com", password: "password"})
User.create({username: "admin2", email: "c@c.com", password: "password"})
Game.create({player1_id: 1, player2_id: 2})
Board.create({player_id: 1, game_id: 1})
Board.create({player_id: 2, game_id: 1 })
Ship.create({type_name: "Cruiser", size: 4, position: "Yeah whatever", sunk: false, board_id: 1})
Ship.create({type_name: "Cruiser", size: 4, position: "Yeah whatever", sunk: false, board_id: 2})
