
def cell_status(matrix,i,j)
  # this manage if the cell die or remain alive based on the number of alive cells around it
  out = 0 # number of alive cells around the cell

  #(i-1>=0 && i-1<matrix.size && j-1>=0 && j<matrix.size) ? (matrix[i-1][j-1] ? out += 1 : out) : nil   # up left
  #(i-1>=0 && i-1<matrix.size && j>=0 && j<matrix.size) ? (matrix[i-1][j] ? out += 1 : out) : nil       # up
  #(i-1>=0 && i-1<matrix.size && j+1>=0 && j+1<matrix.size) ? (matrix[i-1][j+1] ? out += 1 : out) : nil # up right
  #(i>=0 && i<matrix.size && j-1>=0 && j-1<matrix.size) ? (matrix[i][j-1] ? out += 1 : out) : nil       # left
  #(i>=0 && i<matrix.size && j+1>=0 && j+1<matrix.size) ? (matrix[i][j+1] ? out += 1 : out) : nil       # right
  #(i+1>=0 && i+1<matrix.size && j-1>=0 && j-1<matrix.size) ? (matrix[i+1][j-1] ? out += 1 : out) : nil # down left
  #(i+1>=0 && i+1<matrix.size && j>=0 && j<matrix.size) ? (matrix[i+1][j] ? out += 1 : out) : nil       # down
  #(i+1>=0 && i+1<matrix.size && j+1>=0 && j+1<matrix.size) ? (matrix[i+1][j+1] ? out += 1 : out) : nil # down right

  neighbors_index = [
    [-1,-1], [-1,0], [-1,1],
    [0,-1], [0,1],
    [1,-1], [1,0], [1,1]
  ]

  neighbors_index.each do |index|
    x = i + index[0]
    y = j + index[1]
    if x >= 0 && x < matrix.size && y >= 0 && y < matrix.size
      out += 1 if matrix[x][y]
    end
  end

  if (matrix[i][j]) && out < 2
    return false #the cell dies
  elsif (matrix[i][j]) && (out == 3 || out == 2)
    return true #the cell remains alive
  elsif (matrix[i][j]) && out > 3
    return false # the cell dies
  elsif (!matrix[i][j]) && out == 3
    return true # the cell becomes alive
  else
    return false # this condition is not necessary
  end
end

def start_life(matrix, generation)
  loop do
    generation += 1
    ghost_matrix = []
    matrix.each_with_index do |row, i|
      ghost_matrix << []
      row.each_with_index do |cell, j|
        a = cell_status(matrix, i, j)
        ghost_matrix[i] << a
      end
    end
    matrix = ghost_matrix
    system('clear') 
    print_matrix(matrix, 0, 0, false, generation)
    sleep 1
  end
end