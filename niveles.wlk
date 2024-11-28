import menus.*
import miscelaneos.*
import muros.*
import enemigos.*
object niveles{
    const property listaPosiciones = []
    const property listaPuntos = []
    const property listaBloques = []
    const property listaEnemigos = []
    var property nivel = 0
    var property niveles_cargados = [nivel_1, nivel_2, nivel_3, nivel_4, nivel_5, nivel_6, nivel_7, nivel_8] 

    method generarEscenario(nivel_mapa){
       (16 .. 0).forEach({
            y =>
            (0..17).forEach({
                x => nivel_mapa.get(y).get(x).decodificar(x, y)
                })
        })
    }

    method activarEnemigos() = listaEnemigos.forEach({enemigo => enemigo.activar_enemigo()})

    method limpiarBloques() = listaBloques.forEach({block => block.quitarBloque() listaBloques.remove(block)})
    method limpiarPuntos() = listaPuntos.forEach({punto => listaPuntos.remove(punto)})
    method limpiarEscenario() {
      self.limpiarBloques()
      self.limpiarPuntos()
    }

    method mismaPosicion(posiblePosicion) = listaPosiciones.any({posicion => posicion == posiblePosicion})
    method mismaPosicionPunto(posiblePosicion) = listaPuntos.any({posicion => posicion == posiblePosicion})
    method quitarPosicion(posiblePosicion){ self.listaPosiciones().remove(self.listaPosiciones().find({posicion => posicion == posiblePosicion})) }

    method enlistarObjeto(cosa) = listaPuntos.add(cosa)
    method enlistarBloque(block) = listaBloques.add(block)

    method quitarObjeto(cosa) = listaPuntos.remove(cosa)
    method sacarBloqueDeLista(block) = listaBloques.remove(block)

    method enlistarEnemigo(enemigo) = listaEnemigos.add(enemigo)
    method quitarEnemigo(enemigo){ 
        listaEnemigos.remove(enemigo)
        if(listaEnemigos.size() == 0) sincronizadorDePantallas.cambiarPantalla("ganador")
    }

    method devolver_nivel() = niveles_cargados.get(nivel)

    method sacar_todo(){
        listaPosiciones.clear()
        listaPuntos.clear()
        listaBloques.clear()
        listaEnemigos.clear()
    }
}

object b {
    method decodificar(x,y) 
    {
        niveles.listaPosiciones().add(game.at(x,y)) 
        new Bloque().ubicarYDibujar(x,y)
    }
}

object n {
    method decodificar(x,y) {}
}

object e{
    method decodificar(x, y){
        niveles.enlistarEnemigo(new Enemigo1(vida = 50, x_inicial = x, y_inicial = y))
    }
}

object nivel_1{
    const nivel1 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,b,b,b,n,n,n,n,n,e,n,n,b,b,b,n,n],
                    [n,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,n],
                    [n,n,b,n,b,n,n,n,n,n,n,n,n,b,n,b,n,n],
                    [n,n,b,e,b,n,n,n,n,n,n,n,n,b,n,b,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n],
                    [n,n,n,b,n,n,n,n,b,b,n,n,n,n,b,n,n,n],
                    [n,n,n,n,b,b,n,n,b,b,n,n,b,b,n,n,n,n],
                    [n,n,n,n,n,n,b,b,n,n,b,b,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,e,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,n]]

    method crear_nivel(){
       niveles.generarEscenario(nivel1)
    }
}

object nivel_2{
    const nivel2 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,n,n,n,n,n,n,n,n,b,b,b,n,n,n],
                    [n,b,n,n,n,n,n,n,b,n,n,n,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n],
                    [n,b,b,b,n,n,n,n,n,n,n,b,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,b,n,n,b,n,n,n],
                    [n,n,n,n,n,b,b,b,n,n,n,b,n,n,b,n,n,n],
                    [n,n,n,n,n,b,n,b,n,n,n,b,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,b,n,n,n,b,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,b,n,n,n,b,b,b,b,n,n,n],
                    [n,b,n,n,b,n,n,b,n,n,n,n,n,n,n,n,n,n],
                    [n,b,n,n,b,n,n,b,n,n,n,n,n,n,n,b,n,n],
                    [n,b,n,n,b,b,b,b,n,n,n,n,n,n,n,n,n,n],
                    [n,b,n,n,n,n,n,n,n,n,n,n,n,b,n,n,n,n],
                    [n,n,n,n,n,b,b,b,b,b,b,b,b,b,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,n]]

    method crear_nivel(){
       niveles.generarEscenario(nivel2)
    }
}

object nivel_3{
    const nivel3 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,n,n,n,n,n,n,n,n,b,b,b,n,n,n],
                    [n,b,n,n,n,n,n,n,b,n,n,n,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,n,b,b,b,b,n,n,n,n,n,n],
                    [n,b,b,b,n,n,n,n,n,n,n,b,n,n,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,b,n,n,b,n,n,n],
                    [n,n,n,n,n,b,b,b,n,n,n,b,n,n,b,n,n,n],
                    [n,n,n,n,n,b,n,b,n,n,n,b,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,b,n,n,n,b,n,n,b,n,n,n],
                    [n,b,n,n,n,n,n,b,n,n,n,b,b,b,b,n,n,n],
                    [n,b,n,n,b,n,n,b,n,n,n,n,n,n,n,n,n,n],
                    [n,b,n,n,b,n,n,b,n,n,n,n,n,n,n,b,n,n],
                    [n,b,n,n,b,b,b,b,n,n,n,n,n,n,n,n,n,n],
                    [n,b,n,n,n,n,n,n,n,n,n,n,n,b,n,n,n,n],
                    [n,n,n,n,n,b,b,b,b,b,b,b,b,b,n,n,n,n],
                    [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                    [n,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,b,n]]

    method crear_nivel(){
       niveles.generarEscenario(nivel3)
    }
}

object nivel_4{
const nivel4 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,b,n,n,n,n],
                [n,n,n,b,n,n,n,n,n,n,n,n,n,b,n,e,n,n],
                [n,b,n,b,b,n,n,e,n,n,n,n,n,b,n,n,n,n],
                [n,b,n,n,b,n,n,n,n,n,n,n,n,b,n,n,n,n],
                [n,b,b,b,b,b,n,n,n,b,b,b,b,b,b,b,b,n],
                [n,n,n,n,n,b,n,n,n,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,n,b,n,n,n,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,n,b,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,b,b,b,b,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,n,n,n,b,n,n,n,n,n,b,n,e,n,n],
                [n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n,n],
                [n,b,b,b,b,b,n,b,n,n,n,n,n,n,n,n,n,n],
                [n,b,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n,n],
                [n,b,n,n,n,n,n,b,b,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n]];

    method crear_nivel(){
       niveles.generarEscenario(nivel4)
    }
}

object nivel_5{
const nivel5 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,b,b,b,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,b,n,n,b,n,n,n,e,n,n,n,n,b,n,n,n],
                [n,n,b,n,n,b,b,b,n,n,n,n,n,n,b,n,n,n],
                [n,n,b,n,n,n,n,b,b,n,n,n,b,b,b,b,b,n],
                [n,n,b,b,b,n,n,n,b,n,n,n,n,n,b,n,n,n],
                [n,n,n,n,n,b,n,n,n,n,n,n,n,n,b,n,n,n],
                [n,b,b,n,n,b,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,b,n,b,n,b,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,b,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,b,b,n,n,n,n,n,n,n,n,b,n,n,e,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,b,n,n,n,n,n,n],
                [n,b,b,b,b,b,n,n,n,n,n,b,n,n,n,n,n,n],
                [n,b,n,n,n,n,n,n,n,n,n,b,n,n,n,n,n,n],
                [n,b,b,n,n,n,n,n,n,n,n,b,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,b,b,b,b,b,n,n,n,n,n,n],
                [n,n,n,n,n,n,e,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n]];

    method crear_nivel(){
       niveles.generarEscenario(nivel5)
    }
}

object nivel_6{
const nivel6 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,b,n,n],
                [n,b,b,b,n,n,n,n,n,n,n,n,b,n,n,n,n,n],
                [n,n,n,b,n,n,n,n,b,n,n,n,b,b,b,b,n,n],
                [n,n,n,b,n,n,n,b,b,b,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,b,n,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,b,n,n,b,n,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,e,n,n,n,n,n,n,n],
                [n,n,n,n,b,b,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,b,n,n,n,n,n,n,b,b,b,n,n,n],
                [n,b,n,n,n,n,n,n,n,n,n,n,b,e,b,n,n,n],
                [n,b,n,n,n,b,b,b,n,n,n,n,b,n,n,n,n,n],
                [n,n,n,n,n,b,n,n,n,n,n,n,b,n,n,n,n,n],
                [n,n,n,n,n,b,b,n,n,n,n,n,b,n,b,n,n,n],
                [n,n,n,n,n,n,e,n,n,n,n,n,n,n,b,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n]];


    method crear_nivel(){
       niveles.generarEscenario(nivel6)
    }
}

object nivel_7{
const nivel7 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,b,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,n,n,n],
                [n,b,b,b,n,n,n,n,n,n,n,n,b,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,b,n,b,n,n],
                [n,n,n,n,n,n,n,b,n,b,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,b,n,n,n,n,n,n,n,n,b,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,e,n,n,n,n,n,n,n],
                [n,n,n,n,b,b,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,b,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,b,n,n,n,n,n,n,n,n,n,n,b,e,n,n,n,n],
                [n,b,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,b,n,n,b,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,b,n,b,n,n,n],
                [n,n,n,n,n,n,e,n,n,n,b,n,n,n,b,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n]];


    method crear_nivel(){
       niveles.generarEscenario(nivel7)
    }
}

object nivel_8{
const nivel8 = [[n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,n],
                [n,n,n,n,n,n,n,n,n,n,e,n,n,n,b,b,b,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,n],
                [n,n,n,n,n,e,n,n,n,n,n,n,n,n,b,b,b,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,b,b,b,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,e,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,b,n,n,n,n,n,n,n,n,n],
                [n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n]];


    method crear_nivel(){
       self.mezclar_mapa()
       niveles.generarEscenario(nivel8)
    }

    method mezclar_mapa(){
        nivel8.forEach({lista => 
            lista.randomize()
        })
    }
}