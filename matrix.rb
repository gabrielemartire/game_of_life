def print_matrix(matrix, x, y, editing = true, generation = 0)
  system('clear') #clear the screen
  alive_population = 0
  matrix.each_with_index do |row, i|
    r = ""
    row.each_with_index do |cell, j|
      # puts "valore cella #{i}/#{j} = #{cell ? 'T' : 'F'}]"
      r << if (editing)
        if (x==i && y==j)
          " #{cell ? '▒' : '░'} "
        else
          " #{cell ? '■' : ' '} "
        end
      else
        if cell
          alive_population +=1
          " ■ "
        else
          "   "
        end
      end
    end
    puts r + "|"
  end
  puts ('_' * ((matrix.size*3))+ "|")
  puts "Alive population: #{alive_population}" if editing == false
  puts "Generation: #{generation}" if editing == false
end

def create_world(matrix, position_x, position_y)
  puts "Inserisci la dimensione della matrix"
  matrix_size = gets.chomp.to_i
  puts (matrix_size ==0) ? "ERR" : "using a #{matrix_size.to_i} matrix"
  
  matrix_size.times do |i|
    matrix << []
    matrix_size.times do |j|
      matrix[i] << false
    end
  end
  print_matrix(matrix, position_x, position_y)
end
