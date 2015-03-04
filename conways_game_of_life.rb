#create Board

    @grid = [
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ','0 ',' ',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' ']
    ]
    @grid2 = [
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0',' ','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' '],
      [' ',' ',' ','0','0','0',' ',' ',' ',' ']
    ]

# @grid[0][0] = 'r'


  def show_board
    @grid.each do |row|
      puts row.map{ |col| col}.join(' ')
    end
  end

  def cell_alive
    @alive ? [2,3].include?(alive_neighbors_count) : alive_neighbors_count == 3
  end

  def alive_neighbors_count(x, y)
  
    @alive_counter = 0
     @alive_counter += 1 if @grid[x-1 < 0 ? 9 : x-1][y-1 < 0 ? 9 : y-1] == '0' 
     @alive_counter += 1 if @grid[x-1 < 0 ? 9 : x-1][y] == '0' 
     @alive_counter += 1 if @grid[x-1 < 0 ? 9: x-1][y+1 > 9 ? 0: y+1] == '0'
     @alive_counter += 1 if @grid[x][y-1< 0 ? 9: y-1]   == '0'
     @alive_counter += 1 if @grid[x][y+1 > 9 ? 0: y+1]   == '0'
     @alive_counter += 1 if @grid[x+1 > 9 ? 0: x+1][y-1< 0 ? 9: y-1] == '0'
     @alive_counter += 1 if @grid[x+1 > 9 ? 0: x+1][y]   == '0'
    @alive_counter += 1 if @grid[x+1 > 9 ? 0: x+1][y+1 > 9 ? 0: y+1] == '0' 
    return @alive_counter
  end
  def check_alive_count
    @grid.each_with_index do |row,row_index|
      row.each_with_index do |cell, col_index|
        @row_index = row_index
        @col_index = col_index
         @grid2[row_index][col_index] = apply_rules(alive_neighbors_count(row_index, col_index))

    end
    end  
  end
  def replace_grid
    @grid.inject {@grid2}
    show_board
  end



def apply_rules(numberofaliveneighbors)
  if numberofaliveneighbors <= 1 
    return ' '
  elsif numberofaliveneighbors >= 4
    return ' ' 
  elsif numberofaliveneighbors == 3
    return '0'
  elsif numberofaliveneighbors == 2
    return @grid[@row_index][@col_index]
  end
end
# initalize
check_alive_count
replace_grid
# alive_neighbors_count(0,0)



