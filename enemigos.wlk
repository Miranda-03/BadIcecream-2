import menus.*
import wollok.game.*


class Enemigo1{
    var lado = 0
    var property vida

    var property position = game.center()
    var property velocidad = 700 
    //var lado = 0
    const apariencia = "piopio.png" 
    method image() = apariencia

    method soyBloque() = false
    method esFruta() = false

    var property vector_movimiento = [0, 1, 0, 0] 

    method movimiento(){
        game.onTick(velocidad, self, {self.moverse()})
    }

    method cambiar_vector_movimiento() {
      const primer_elemento = vector_movimiento.take(1)
      vector_movimiento.remove(vector_movimiento.get(0))
      vector_movimiento.addAll(primer_elemento)
    }

    method detectar_colisiones() {
        game.onCollideDo(self, {elemento => 
          if(elemento.soyBloque()){
            self.volver()
            self.cambiar_vector_movimiento() 
          }
        })
    }

    method volver() {
         position = position.left(vector_movimiento.get(0) * -1)
                    .down(vector_movimiento.get(1) * -1)
                    .right(vector_movimiento.get(2) * -1)
                    .up(vector_movimiento.get(3) * -1)
    }

    method moverse(){
        position = position.left(vector_movimiento.get(0))
                    .down(vector_movimiento.get(1))
                    .right(vector_movimiento.get(2))
                    .up(vector_movimiento.get(3))
    }

    method activar_enemigo() {
      game.addVisual(self)
	    self.movimiento()
	    self.detectar_colisiones()
    }

    method herido() {
      vida -= 50
      if(vida == 0){
        self.morir()
      }
    }

    method morir() {
      sincronizadorDePantallas.cambiarPantalla("ganador")
      new MenuGanaste().cargar()
    }

    method limpiarEnemigos(){
        game.removeVisual(self)
    }

}

object lineaEnemiga{
    var property enemigo = new Enemigo1(vida = 150)

    method activar(){
        game.addVisual(enemigo)
        enemigo.moverseH(4,13)
    }
}