#create Board
class Board
  def show_grid
@grid = [
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','',''],
  ['','','','0','0','','','','','']
]
@grid.each do |row|
puts row.map{ |col| col}.join(' ')
end
end
def alive_or_dead
  @grid.each do |row, col|
  @alive = if @grid[row][col]=0
end
end
def alive_neighbors(x,y)
@neigbors=[[-1, -1],[-1,0], [-1, 1],[0,-1],[0,1],[1,-1],[1,0],[1,1]]





end

#checking neigbors



Board
#if 0 true,
