require_relative './coordinate.rb'


class Board
  attr_accessor :factories
  def initialize
    @factories = {
      Pawn: Pawnfactory.new(self),
      Knight: Knightfactory.new(self),
      Rook: Rookfactory.new(self),
      Queen: Queenfactory.new(self),
      King: Kingfactory.new(self)      
    }
    
  end

  def self.new_standard
    Board.new.papulate
  end
  


  def papulate!
    black_king = King.new(self, :black)
    white_king = Knight.new(self, :white)
    new_piece(Coordinate.new(4,7),Black_king)
    new_piece(Coordinate.new(4,7),White_king)

    self.factories[:Queen].create_piece(:black, Coordinate.new(3,7))
    self.factories[:Queen].create_piece(:white, Coordinate.new(3,0))
    self.factories[:Bishop].create_piece(:black, Coordinate.new(2,7))
    self.factories[:Bishop].create_piece(:black, Coordinate.new(5,7))
    self.factories[:Bishop].create_piece(:white, Coordinate.new(2,0))
    self.factories[:Bishop].create_piece(:white, Coordinate.new(5,0))
    self.factories[:Knight].create_piece(:black, Coordinate.new(1,7))
    self.factories[:Knight].create_piece(:black, Coordinate.new(6,7))
    self.factories[:Knight].create_piece(:white, Coordinate.new(1,0))
    self.factories[:Knight].create_piece(:white, Coordinate.new(6,0))
    self.factories[:Rook].create_piece(:black, Coordinate.new(0,7))
    self.factories[:Rook].create_piece(:black, Coordinate.new(7,7))
    self.factories[:Rook].create_piece(:white, Coordinate.new(0,0))
    self.factories[:Rook].create_piece(:white, Coordinate.new(7,0))

    0.upto 7 do |col|
      self.factories[:Pawn].create_piece(:white, Coordinate.new(col, 1))
      self.factories[:Pawn].create_piece(:black, Coordinate.new(col, 6))
    end

  end
  def populate
    self.populate!
    self
  end

end