require 'bundler/setup' # require the dependencies listed in the Gemfile
require 'io/console'
require_relative 'matrix'
require_relative 'game_of_life'

position_x = 0 # current position to navigate the matrix
position_y = 0 # current position to navigate the matrix
matrix = []
alive_population = 0
generation = 0

create_world(matrix, position_x, position_y)

loop do
  puts "WASD to move, SPACE to change cell status, R to start life, Q to quit"
  input = STDIN.getch # waiting a key
  case input
  when "w"
    position_x -= 1 if position_x > 0
  when "s"
    position_x += 1 if position_x < matrix.size-1
  when "a"
    position_y -= 1 if position_y > 0
  when "d"
    position_y += 1 if position_y < matrix.size-1
  when " "  # space
    matrix[position_x][position_y] = !matrix[position_x][position_y] # dead or alive
  when "r" 
    start_life(matrix, generation)
  when "q"
    break
  else
    
  end
  print_matrix(matrix, position_x, position_y)
end