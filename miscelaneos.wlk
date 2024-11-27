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
    method image() = "PP_niveles_2.png"
}
object finDelJuego{
    var property position = game.origin()
    method image() = "PP_final.png"
}

object moverAbajo{
    method mover(posicion) {posicion.goDown(1)}
    method retroceder(posicion) {posicion.goDown(-1) }
}

object moverArriba{
    method mover(posicion) {posicion.goUp(1)}
    method retroceder(posicion) {posicion.goUp(-1)}
}

object moverDerecha{
    method mover(posicion){ posicion.goRight(1)}
    method retroceder(posicion) { posicion.goRight(-1)}
}

object moverIzquierda{
    method mover(posicion)  {posicion.goLeft(1)}
    method retroceder(posicion) {posicion.goLeft(-1)}
}

object cambiarDireccion{
    const property vectorDirecciones = [moverIzquierda, moverAbajo, moverDerecha, moverArriba]

    method rotarDireccion(direccionActual) = self.vectorDirecciones().anyOne()
    
}


//IMAGENES DE SELECCION
object marcoDeSeleccion{
    var property position = game.at(2,5)
    method image() = "S_personajes.png"
}
class SeleccionNivel{
    var property position = game.at(1, 11)
    method image() = "S_niveles.png"
}
class SeleccionGanaste{
    var property position = game.at(6, 5)
    method image() = "S_niveles.png"
}
class SeleccionPerdiste{
    var property position = game.at(5, 7)
    method image() = "S_derrota.png"
}

//BACKGROUND
object fondoJuego{
    var property position = game.origin()
    var property valor = "f_slime.png"
    method image() = valor
    // override method esFondo() = true 
}

//IMAGENES RELACIONADA A LOS PERSONAJES
object coleccion{
    const c_personajes = ["p_helado.png", "p_piopio.png", "p_goku.png"]
    const c_animaciones_d = ["ataque_d_helado.png", "ataque_d_piopio.png", "ataque_d_goku.png"]
    const c_animaciones_i = ["ataque_i_helado.png", "ataque_i_piopio.png","ataque_i_goku.png"]
    const c_ataques_d = ["a_d_helados.png","a_d_granada.png","a_d_kame.png"]
    const c_ataques_i = ["a_i_helados.png","a_i_granada.png","a_i_kame.png"]
    
    const c_ataques_sound = ["sonido_helado.mp3","sonido_pepita.mp3","Kamehameha.mp3"]
    
    const c_enemigos = ["e_brocoli.png", "e_elusive.png", "e_cell.png"]
    const c_bloques = ["bq_fiesta_i.png","bq_pio_i.png","bq_pasto_i.png"]
    const c_bloques_sup = ["bq_fiesta_sup.png","bq_pio_sup.png","bq_pasto_sup.png"]
    const c_fondos = ["fd_slime.png","fd_pio.png","fd_pasto.png"]
    const c_puntos = [["pu_bananas.png","pu_uva.png","pu_sandia.png"],
                      ["pu_archaic coin.png","pu_circus coin.png","pu_lunaver coin.png"],
                      ["pu_semilla.png","pu_capsula.png","pu_comida.png"]]
    const c_musica = ["BadIceCreamMusicaDeFondo.mp3", "Flow Hero.mp3", "Super Survivor.mp3"]

    method personaje(indice) = c_personajes.get(indice)
    method animacion_d(indice) = c_animaciones_d.get(indice)
    method animacion_i(indice) = c_animaciones_i.get(indice)
    method ataque_d(indice) = c_ataques_d.get(indice)
    method ataque_i(indice) = c_ataques_i.get(indice)
    method enemigo(indice) = c_enemigos.get(indice)
    method bloque_i(indice) = c_bloques.get(indice)
    method bloque_s(indice) = c_bloques_sup.get(indice)
    method fondo(indice) = c_fondos.get(indice)
    method puntos(indice) = c_puntos.get(indice)
    method musica(indice) = c_musica.get(indice)
    method sonido(indice) = c_ataques_sound.get(indice)
}