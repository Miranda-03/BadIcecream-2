import jugador.*
import muros.*
class Fruta{
	var property position = posicionAleatoria.generarPosicionAleatoria()

	method image(){
		if(points.frutasObtenidas() < 10){
			if(jugador.image() == "heladon.png"){
				return "bananas.png"
			} else if (jugador.image() == "piopio.png"){
				return "circus coin.png"
			} else {
				return "semilla.png"
			}
		}if(points.frutasObtenidas() < 20){
			if(jugador.image() == "heladon.png"){
				return "uva.png"
			} else if (jugador.image() == "piopio.png"){
				return "lunaver coin.png"
			} else {
				return "capsula.png"
			}
		}
		if(jugador.image() == "heladon.png"){
				return "sandia1.png"
			} else if (jugador.image() == "piopio.png"){
				return "archaic coin.png"
			} else {
				return "comida.png"
			}
	}

  	method esFruta() = true
  	method ubicarYDibujar(posicion){
        self.position(posicion)
        game.addVisual(self)
    }
}

object spawn{
	method dibujarFrutas(){
		(0..9).forEach({x => new Fruta().ubicarYDibujar(posicionAleatoria.generarPosicionAleatoria())})
	}
}

object posicionAleatoria {
	method generarPosX() = 1.randomUpTo(game.width() - 1).truncate(0)
	method generarPosY() = 1.randomUpTo(game.height() - 1).truncate(0)

	method generarPosicionAleatoria(){
		const x = self.generarPosX()
		const y = self.generarPosY()
		
		if(escenario.mismaPosicion(game.at(x, y)) || escenario.mismaPosicionFruta(game.at(x, y))){
			return self.generarPosicionAleatoria()
		}
		escenario.enlistarObjeto(game.at(x, y))
		return game.at(x, y)
	}
}