import niveles.*
import miscelaneos.*
import muros.*
import wollok.game.*
import movimiento.*
import jugador.*
import menus.*

class Enemigo1{
    
    var property vida
    var property velocidad = 200
    var property y_inicial
    var property x_inicial  
    var property position = new PosicionVariable(x = x_inicial, y = y_inicial)
    method image() = aparienciaEnemigo.valor()
    var property direccion = moverDerecha 

    method movimiento(){
        game.onTick(velocidad, self, {
            self.direccion().mover(position)
            if(niveles.mismaPosicion(position) || !(position.x() >= 1 && position.x() <= (game.width()-2) && position.y() >= 1 && position.y() <= (game.height()-2))){
                self.direccion().retroceder(position)
                self.direccion(cambiarDireccion.rotarDireccion(self.direccion()))
            }
        })
    }

    method activar_enemigo() {
      game.addVisual(self)
	  self.movimiento()
    }

    method limpiarEnemigos(){
        game.removeVisual(self)
    }

    method atacado(bala){
        bala.impacto(1)
        self.herido()
    }

    method accion(jugador) {
      jugador.impactado()
    }

    method herido() {
      vida -= 50
      if(vida == 0){
        self.morir()
      }
    }

    method morir(){
        game.removeVisual(self)
        niveles.quitarEnemigo(self)
    }
}

object aparienciaEnemigo {
   var property valor = null
}