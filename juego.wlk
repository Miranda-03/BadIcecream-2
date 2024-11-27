import musica.*
import jugador.*
import muros.*
import enemigos.*
import puntos.*
import miscelaneos.*
import niveles.*

object juego{
//DIBUJO DE LOS ELEMENTOS DEL MUNDO    
	method jugar(){ 
		game.clear()
        points.reset()
		niveles.sacar_todo()
		//dibujar fondo
		game.addVisual(fondoJuego)
		//dibujar muros
		niveles.devolver_nivel().crear_nivel()
		//dibujar enemigo
		//const jugador = new 
		new Jugador(valor = datosJugador.imagen()).posicionate()
		//dibujar frutas
		spawn.dibujarPuntos(1)
		//dibujar puntos
		game.addVisual(points)
		//Activar el movimiento del enemigo 
		niveles.activarEnemigos()
		// game.onCollideDo(atajos.enemigo(), {elemento => elemento.impactado()})
		//niveles.activarEnemigos()
		musica.sonido_continue()
	}

//BORRAR ELEMENTOS DEL JUEGO
    method limpiar(){
		if(niveles.listaEnemigos().size() > 0) atajos.enemigo().limpiarEnemigos()
		game.removeVisual(fondoJuego)
		game.removeVisual(points)
		niveles.limpiarEscenario()
		game.clear()
    }

    method cargarVisuales(posicion){
        datosJugador.imagen(coleccion.personaje(posicion))
		datosJugador.imagen_ataque_izquierdo(coleccion.ataque_i(posicion))
		datosJugador.imagen_ataque_derecho(coleccion.ataque_d(posicion))
		datosJugador.imagen_atacando_izquierda(coleccion.animacion_i(posicion))
		datosJugador.imagen_atacando_derecha(coleccion.animacion_d(posicion))
		aparienciaEnemigo.valor(coleccion.enemigo(posicion))
		fondoJuego.valor(coleccion.fondo(posicion))
        visual.valor(coleccion.bloque_i(posicion))
		visualSuperior.valor(coleccion.bloque_s(posicion))
		spawn.puntos(coleccion.puntos(posicion))
    }
	method cargarSonido(posicion){
	  datosJugador.sonido_ataque(coleccion.sonido(posicion))
	}
}