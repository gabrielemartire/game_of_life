# X è la riga
# Y è la colonna

require 'bundler/setup'
require 'io/console'

matrice = []
position_x = 0 # current position to navigate the matrice
position_y = 0 # current position to navigate the matrice
alive_population = 0

def print_matrice(matrix, x, y, editing = true)
  system('clear') #clear the screen
  alive_population = 0
  matrix.each_with_index do |row, i|
    r = ""
    row.each_with_index do |cell, j|
      # puts "valore cella #{i}/#{j} = #{cell ? 'T' : 'F'}]"
      r << if (editing)
        if (x==i && y==j)
          "[#{cell ? '■' : ' '}]"
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
  puts "Alive population: #{alive_population}"
end

def create_world(matrice, position_x, position_y)
  puts "Inserisci la dimensione della matrice"
  matrice_size = gets.chomp.to_i
  puts (matrice_size ==0) ? "ERR" : "using a #{matrice_size.to_i} matrice"
  
  matrice_size.times do |i|
    matrice << []
    matrice_size.times do |j|
      matrice[i] << false
    end
  end
  print_matrice(matrice, position_x, position_y)
end

def cell_status(matrice,i,j)
  #controllo se la cella è viva o morta e restituisco il nuovo stato in base al valore delle 8 celle intorno
  out = 0

  (i-1>=0 && i-1<matrice.size && j-1>=0 && j<matrice.size) ? (matrice[i-1][j-1] ? out += 1 : out) : nil   #cella sopra a sinistra
  (i-1>=0 && i-1<matrice.size && j>=0 && j<matrice.size) ? (matrice[i-1][j] ? out += 1 : out) : nil       #cella sopra
  (i-1>=0 && i-1<matrice.size && j+1>=0 && j+1<matrice.size) ? (matrice[i-1][j+1] ? out += 1 : out) : nil #cella sopra a destra
  (i>=0 && i<matrice.size && j-1>=0 && j-1<matrice.size) ? (matrice[i][j-1] ? out += 1 : out) : nil       #cella a sinistra
  (i>=0 && i<matrice.size && j+1>=0 && j+1<matrice.size) ? (matrice[i][j+1] ? out += 1 : out) : nil       #cella a destra
  (i+1>=0 && i+1<matrice.size && j-1>=0 && j-1<matrice.size) ? (matrice[i+1][j-1] ? out += 1 : out) : nil #cella sotto a sinistra
  (i+1>=0 && i+1<matrice.size && j>=0 && j<matrice.size) ? (matrice[i+1][j] ? out += 1 : out) : nil       #cella sotto
  (i+1>=0 && i+1<matrice.size && j+1>=0 && j+1<matrice.size) ? (matrice[i+1][j+1] ? out += 1 : out) : nil #cella sotto a destra
  if (matrice[i][j]) && out < 2
    return false #la cella muore
  elsif (matrice[i][j]) && (out == 3 || out == 2)
    return true #la cella sopravvive
  elsif (matrice[i][j]) && out > 3
    return false #la cella nasce
  elsif (!matrice[i][j]) && out == 3
    return true #la cella nasce
  else
    return false #la cella rimane morta ma in teoria non ci entro mai qua
  end
end

def start_life(matrice)
  puts "in the loop"
  loop do
    ghost_matrice = []
    matrice.each_with_index do |row, i|
      ghost_matrice << []
      row.each_with_index do |cell, j|
        a = cell_status(matrice, i, j)
        ghost_matrice[i] << a
      end
    end
    matrice = ghost_matrice
    system('clear') 
    print_matrice(matrice, 0, 0, false)
    sleep 1
  end
end


create_world(matrice, position_x, position_y)

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
  elsif input == " "
    matrice[position_x][position_y] = !matrice[position_x][position_y] # inverti valore
  elsif input == "\r"
    # puts "avvio"
    start_life(matrice)
  elsif input == "q"
    break
  else
  end
  print_matrice(matrice, position_x, position_y)
end

