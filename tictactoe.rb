# classe jugador define jugador y escoge posicion
class Jugador
  attr_reader :simbolo, :nombre

  def initialize(tictactoe, simbolo, nombre)
    @tictactoe = tictactoe
    @simbolo = simbolo
    @nombre = nombre
  end

## comprobar q las posiciones van entre 0 y 3 o escalable****
  def escogerposi
    loop do
      puts "#{@nombre}, escoge un numero de vertice X:"
      escogerposiX = gets.to_i
      puts "#{@nombre}, escoge un numero de vertice Y:"
      escogerposiY = gets.to_i
      if @tictactoe.tablero[escogerposiX - 1][escogerposiY - 1] == 0
        @tictactoe.tablero[escogerposiX - 1][escogerposiY - 1] = @simbolo
        return
      else
        puts 'Posicion escogida no esta disponible.'
      end
    end
  end
end

# classe tictactoe define tablero y ejecuta funcion jugar
class Tictactoe
  attr_reader :tablero

  def initialize
    @jugadores = [
      Jugador.new(self, 'x', 'Jugador1'),
      Jugador.new(self, 'o', 'Jugador2')
    ]
    @jugador_actual = @jugadores[0]
    @tablero = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
  end

  def print_tablero
    divisor = '--+---+--'
    puts "#{@tablero[0][0]} | #{@tablero[0][1]} | #{@tablero[0][2]}"
    puts divisor
    puts "#{@tablero[1][0]} | #{@tablero[1][1]} | #{@tablero[1][2]}"
    puts divisor
    puts "#{@tablero[2][0]} | #{@tablero[2][1]} | #{@tablero[2][2]}"
  end

  def ganador
    return false
  end

  def empate
    for row in @tablero do
      if row.include?(0)
        return false
      end
    end
    true
  end

  def jugar_again
    loop do
      print "Jugar otra vez? y/n"
      awnser = gets.chomp.downcase
      if awnser == 'n'
        exit
      elsif awnser == 'y'
        initialize
        partida
      end
    end
  end

  def cambiar_jugador
    @jugador_actual = @jugador_actual == @jugadores[0] ? @jugadores[1] : @jugadores[0]
  end

  def partida
    puts 'Bienvenidos a una partida de tres en raya!'
    sleep(1)
    loop do
      puts 'Tablero:'
      print_tablero
      sleep(0.5)
      @jugador_actual.escogerposi
      if ganador(@jugador_actual)
        print_tablero
        sleep(0.5)
        puts "El ganador es: #{@jugador_actual.nombre}"
        jugar_again
      elsif empate
        print_tablero
        sleep(0.5)
        puts 'Empate!'
        jugar_again
      end

      cambiar_jugador
    end
  end
end

new_game = Tictactoe.new
new_game.partida
