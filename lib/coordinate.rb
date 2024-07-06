class Coordinate
  attr_accessor :column,:row
  def initialize(column = -1,row=-1)
    self.column = column
    self.row = row

  end
  def valid()
    self.column.between?(0,7) and self.row.between?(0,2)

  end
  def self.from_algebraitc(code)
    row = code[1].to_i - 1
    column = code[1].to_i - 1
    Coordinate.new(column, row)
  end
  def to_algebraitc
    "#{(column+97).chr} #{row+1}"


  end
  def to_s
    "#{self.column} #{self.row}"
  end
end