require_relative './board'
require 'json'
class Game 

  public
  attr_accessor :players, :in_check, :num_moves, :board
  def initialize
    self.board = Board.new_standard
    self.players = [:white, :black]
    self.in_check = {white: false, black: false}
    self.num_moves = {white: 0, black: 0}

  end
  def to_json
    obj = Hash.new
    obj["board"] = self.board.to_json
    obj["players"] = self.players
    obj["in_check"] = self.in_check
    obj["num_moves"] = self.num_moves
    obj
  end
end