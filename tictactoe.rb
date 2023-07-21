# classe jugador define jugador y escoge posicion
class Jugador
  attr_reader :simbolo, :nombre

  def initialize(tictactoe, simbolo, nombre)
    @tictactoe = tictactoe
    @simbolo = simbolo
    @nombre = nombre
  end

  def escogerposi
    escogerposiX = -1
    escogerposiY = -1
    loop do
      loop do
        puts "#{@nombre}, escoge un numero de vertice X:"
        escogerposiX = gets
        escogerposiX.match(/[0-9]/) ? escogerposiX = escogerposiX.to_i : next
        if escogerposiX > @tictactoe.tablero.length
          puts "El número escogido no es válido. Introduzca un nuevo valor entre 0 y #{@tictactoe.tablero.length}:"
        else
          break
        end
      end
      loop do
        puts "#{@nombre}, escoge un numero de vertice Y:"
        escogerposiY = gets
        escogerposiY.match(/[0-9]/) ? escogerposiY = escogerposiY.to_i : next
        if escogerposiY > @tictactoe.tablero.length
          puts "El número escogido no es válido. Introduzca un nuevo valor entre 0 y #{@tictactoe.tablero.length}:"
        else
          break
        end
      end
      if @tictactoe.tablero[escogerposiX - 1][escogerposiY - 1] == ' '
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
  attr_accessor :tablero

  def initialize
    @jugadores = [
      Jugador.new(self, 'x', 'Bayer'),
      Jugador.new(self, 'o', 'kaNEt')
    ]
    @jugador_actual = @jugadores[0]
    @tablero = [
      [' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']
    ]
  end

  def print_tablero
    divisor = '---+---+---'
    puts " #{@tablero[0][0]} | #{@tablero[0][1]} | #{@tablero[0][2]} "
    puts divisor
    puts " #{@tablero[1][0]} | #{@tablero[1][1]} | #{@tablero[1][2]} "
    puts divisor
    puts " #{@tablero[2][0]} | #{@tablero[2][1]} | #{@tablero[2][2]} "
  end

  def ganador(*)
    diagonal1 = []
    diagonal2 = []
    for row in @tablero.transpose do
      if (row.uniq.size <= 1) && (row[0] == @jugador_actual.simbolo)
        return true
      end
    end
    for row in @tablero do
      if (row.uniq.size <= 1) && (row[0] == @jugador_actual.simbolo)
        return true
      end
    end
    @tablero.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if i == j
          diagonal1.push(col)
        end
      end
    end
    @tablero.reverse.each_with_index do |row, i|
      row.each_with_index do |col, j|
        if i == j
          diagonal2.push(col)
        end
      end
    end
    if (diagonal1.uniq.size <= 1) && (diagonal1[0] == @jugador_actual.simbolo)
      return true
    end
    if (diagonal2.uniq.size <= 1) && (diagonal2[0] == @jugador_actual.simbolo)
      return true
    end
    false
  end

  def empate
    for row in @tablero do
      if row.include?(' ')
        return false
      end
    end
    true
  end

  def jugar_again
    loop do
      print 'Jugar otra vez? y/n'
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
    loop do
      puts 'Tablero:'
      print_tablero
      @jugador_actual.escogerposi
      if ganador(@jugador_actual)
        print_tablero
        puts "El ganador es: #{@jugador_actual.nombre}"
        jugar_again
      elsif empate
        print_tablero
        puts 'Empate!'
        jugar_again
      end

      cambiar_jugador
    end
  end
end

new_game = Tictactoe.new
new_game.partida
