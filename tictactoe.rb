# classe jugador define jugador y escoge posicion
class Jugador
  attr_reader :marker, :name

  def initialize
    @tictactoe = tictactoe
    @marker = marker
    @name = name
  end

  def escogerposi
  end
end

# classe tictactoe define tablero y ejecuta funcion jugar
class Tictactoe
  attr_reader :posiciones_dispo

  def initialize
    @jugadores = [
      Jugador.new(self, 'x', 'Jugador1'),
      Jugador.new(self, 'o', 'Jugador2')
    ]
    @jugador_actual = @jugadores[0]
    @@tablero = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
    @posiciones_dispo = [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
  end

  def print_tablero
    divisor = '--+---+--'
    puts "#{@@tablero[0][0]} | #{@@tablero[0][1]} | #{@@tablero[0][2]}"
    puts divisor
    puts "#{@@tablero[1][0]} | #{@@tablero[1][1]} | #{@@tablero[1][2]}"
    puts divisor
    puts "#{@@tablero[2][0]} | #{@@tablero[2][1]} | #{@@tablero[2][2]}"
  end

  def ganador?
  end

  def empate?
    @posiciones_dispo.empty?
  end

  def update_posiciones_dispo(pos)
    @posiciones_dispo.delete(pos)
  end

  def jugar_again?
  end

  def cambiar_jugador
  end

  def partida
    puts 'Bienvenidos a una partida de tres en ralla!'
    sleep(2)
    loop do
      puts 'Tablero:'
      print_tablero
      sleep(0.5)
      posicion_elegida = @jugador_actual.escogerposi
      update_posiciones_dispo(posicion_elegida)
      @@tablero[posicion_elegida - 1] = @jugador_actual.marker
      if winner?
        print_tablero
        sleep(0.5)
        puts "El ganador es: #{@jugador_actual.name}"
        jugar_again?
      elsif draw?
        print_tablero
        sleep(0.5)
        puts 'Empate!'
        jugar_again?
      end

      cambiar_jugador
    end
  end
end

new_game = Tictactoe.new
new_game.print_tablero
