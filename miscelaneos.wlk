//IMAGENES DE PANTALLAS
object ganaste{
    var property position = game.origin()
    method image() = "PP_victoria.png"
}
object perdiste{
    var property position = game.origin()
    method image() = "PP_derrota.png"
}
object menuPersonajes{
    var property position = game.origin()
    method image() = "PP_personajes.png"
}
object menuNiveles{
    var property position = game.origin()
    method image() = "PP_niveles.png"
}
object finDelJuego{
    var property position = game.origin()
    method image() = "PP_final.png"
}

mixin ObjetoVisible {
  method soyBloque() = false
  method esFruta() = false
  method jugador() = false   
  method esEnemigo() = false 
  method esFondo() = false
  method esBloqueSuperior() = false
}

object moverAbajo{
    method vector() = [0, 1, 0, 0]
}

object moverArriba{
    method vector() = [0, 0, 0, 1]
}

object moverDerecha{
    method vector() = [0, 0, 1, 0]
}

object moverIzquierda{
    method vector() = [1, 0, 0, 0]
}

//IMAGENES DE SELECCION
object marcoDeSeleccion{
    var property position = game.at(2,5)
    method image() = "S_personajes.png"
}
object seleccionNivel{
    var property position = game.at(1, 11)
    method image() = "S_niveles.png"
}
object seleccionGanaste{
    var property position = game.at(6, 5)
    method image() = "S_niveles.png"
}
object seleccionPerdiste{
    var property position = game.at(5, 5)
    method image() = "S_derrota.png"
}

//BACKGROUND
object fondoJuego inherits ObjetoVisible{
    var property position = game.origin()
    var property valor = "f_slime.png"
    method image() = valor
    override method esFondo() = true 
}