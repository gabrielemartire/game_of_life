
require 'bundler/setup'
require 'io/console'

matrice = []
position_x = 0 # current position to navigate the matrice
position_y = 0 # current position to navigate the matrice

def create_world(matrice)
  matrice_size = gets.chomp.to_i
  puts (matrice_size ==0) ? "ERR" : "using a #{matrice_size.to_i} matrice"
  
  matrice_size.times do |i|
    matrice << []
    matrice_size.times do |j|
      matrice[i] << false
    end
  end
end

def print_matrice(matrix, x, y, editing = true)
  matrix.each_with_index do |row, i|
    r = ""
    row.each_with_index do |cell, j|
      # puts "valore cella #{i}/#{j} = #{cell ? 'T' : 'F'}]"
      if (editing)
        if (x==i && y==j)
          r << "[#{cell ? '•' : ' '}]"
        else
          r << " #{cell ? '•' : ' '} "
        end
      else
        r << " #{cell ? '•' : ' '} "
      end
    end
    puts r + "|"
  end
  puts ('_' * matrix.size*3)
  puts matrix.size
end

def cell_status(matrice,i,j)
  #controllo se la cella è viva o morta e restituisco il nuovo stato in base al valore delle 8 celle intorno
  out = 0
  matrice[i-1][j] ? out += 1 : out #cella sopra a sinistra
  matrice[i-1][j] ? out += 1 : out #cella sopra
  matrice[i-1][j+1] ? out += 1 : out #cella sopra a destra
  matrice[i][j-1] ? out += 1 : out #cella a sinistra
  matrice[i][j+1] ? out += 1 : out #cella a destra
  matrice[i+1][j-1] ? out += 1 : out #cella sotto a sinistra
  matrice[i+1][j] ? out += 1 : out #cella sotto
  matrice[i+1][j+1] ? out += 1 : out #cella sotto a destra

  if matrice[i][j] && out < 2
    return false #la cella muore
  elsif matrice[i][j] && (out == 3 || out == 2)
    return true #la cella sopravvive
  elsif matrice[i][j] && out > 3
    return false #la cella nasce
  elsif !matrice[i][j] && out == 3
    return true #la cella nasce
  else
    return false #la cella rimane morta mo in teoria non ci entro mai qua
  end
end

def start_life(matrice)
  ghost_matrice = []
  loop do
    matrice.each_with_index do |row, i|
      r = ""
      ghost_matrice << []
      row.each_with_index do |cell, j|
        # puts "valore cella #{i}/#{j} = #{cell ? 'T' : 'F'}]"
        ghost_matrice[i] << cell_status(matrice, i, j)
      end
    end
    matrice = ghost_matrice
  end
  sleep 1
  system('clear') #clear the screen
  print_matrice(matrice, 0, 0, false)
end

create_world(matrice)

print_matrice(matrice, position_x, position_y)

loop do
  input = STDIN.getch # prendo un comando da tastiera
  # i movimenti saranno w, a, s, d
  if input == "w"
    position_x -= 1 if position_x > 0
  elsif input == "s"
    position_x += 1 if position_x < matrice.size-1
  elsif input == "a"
    position_y -= 1 if position_y > 0
  elsif input == "d"
    position_y += 1 if position_y < matrice.size-1
  elsif input == "e"
    matrice[position_x][position_y] = !matrice[position_x][position_y] # inverti valore
  elsif input == "\r"
    puts "avvio"
    start_life(matrice)
  elsif input == "q"
    break
  else
  end
  system('clear') #clear the screen
  print_matrice(matrice, position_x, position_y)
  puts "posizione: [#{position_x}][#{position_y}]: #{matrice.size}"
  puts "inverti con e"
  puts "esci con q"
  puts "avvia con invio"
end

