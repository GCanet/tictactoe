# classe tictactoe define tablero
class Tictactoe
  @@tablero = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
  ]

  def print_tablero
    divisor = '--+---+--'
    puts "#{@@tablero[0][0]} | #{@@tablero[0][1]} | #{@@tablero[0][2]}"
    puts divisor
    puts "#{@@tablero[1][0]} | #{@@tablero[1][1]} | #{@@tablero[1][2]}"
    puts divisor
    puts "#{@@tablero[2][0]} | #{@@tablero[2][1]} | #{@@tablero[2][2]}"
  end
end

new_game = Tictactoe.new
new_game.print_tablero
