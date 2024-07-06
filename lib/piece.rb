require_relative "./coordinate"
require 'json'
ANSI_ESCAPE_FOREGROUND_BLACK = "\033[38;5;0m".freeze

class Piece
  attr_accessor :color, :icon, :position, :Board
  attr_accessor :num_moves, :is_caputed

  protected
  def initialize(board,color, position = Coordinate.new, unccolor_icon) 
    @board = board
    @color = color
    @position = position
    @num_moves = 0
    @is_caputed = false
    @icon = "#{ANSI_ESCAPE_FOREGROUND_BLACK} #{unccolor_icon}"
    @icon =  unccolor_icon if color == :white
  end
  public
  def to_json
    obj = Hash.new
    obj["class"] = self.class
    obj["color"] = self.color
    obj["position"] = self.position.to_algebraitc
    obj["num_moves"] = self.num_moves
    obj["is_captured"] = self.is_captured
    obj
  end
  def valid_moves; end
  def legal_moves
    self.valid.reject{|pos,move| !move.legal?}
    
  end
  def to_s
    "#{icon}"
  end
end

