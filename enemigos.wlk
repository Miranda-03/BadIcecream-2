import niveles.*
import miscelaneos.*
import muros.*
import wollok.game.*
import movimiento.*
import jugador.*
import menus.*

class Enemigo1 inherits FiguraConMovimiento(position = new PosicionVariable(x = 7, y = 13)){
    
    var property vida
    const property posiblePosicion = new PosicionVariable(x = 7, y = 13)
    method image() = aparienciaEnemigo.valor()

    method nuevaPosicion(){
        const direccion = 1.randomUpTo(4).round()//.truncate(0) //elige al azar una dirección
        //var posiblePosicion = 0
        //le da el valor correspondiente
        if(direccion == 1){ //arriba
            self.posiblePosicion().sumarPos(0, 1)
        }
        if(direccion == 2){ //abajo
            self.posiblePosicion().sumarPos(0, -1)
        }
        if(direccion == 3){ //derecha
            self.posiblePosicion().sumarPos(1, 0)
        }

        if(direccion == 4){ //izquierda
            self.posiblePosicion().sumarPos(-1, 0)
        }
            //revisa si la posicion es la de un bloque
        if(niveles.mismaPosicion(self.posiblePosicion()) || !self.equisCorrecta(self.posiblePosicion().x()) || !self.yeCorrecta(self.posiblePosicion().y())){ //si es rehace el mensaje
            self.posiblePosicion().establecerPos(self.position().x(), self.position().y())
            self.nuevaPosicion()
        } 
        else{ //sino devuelve la posicion nueva
                self.position().establecerPos(posiblePosicion.x(), posiblePosicion.y())
        }
    }

    method caminar(){
        //game.onTick(200, self, {self.position(self.nuevaPosicion())})
        game.onTick(400, self, {self.nuevaPosicion()})
    }

    method herido() {
      vida -= 50
      if(vida == 0){
        self.morir()
      }
    }

    method morir(){
        sincronizadorDePantallas.cambiarPantalla("ganador")
    }

    method aparecer(){
        game.addVisual(self)
    }

    method limpiarEnemigos(){
        game.removeVisual(self)
    }
}

object aparienciaEnemigo {
   var property valor = "cell1.png"
}