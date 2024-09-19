
object knightRider {


	method peso() { 
    return 500 
  }
	method nivelPeligrosidad() { 
    return 10 
  }

  method bulto() {
    return 1
  }

    method cambiar() {
    //Este objeto no cambia
  }
}

object bumbleBee {
  
  var estado = auto
  
  method peso() {
	return 800
  }

  method nivelPeligrosidad(_estado) {
	return estado.nivelPeligrosidad()
  }

    method bulto() {
    return 2
  }

  method cambiar() {
    estado = robot
  }
}

object auto {

  method nivelPeligrosidad() {
	return 15
  }
}

object robot {

  method nivelPeligrosidad() {
	return 30
  }
}

object paqueteDeLadrillos {
  var property cantLadrillos = 0

  method peso() {
    return cantLadrillos * 2
  }

  method nivelPeligrosidad() {
    return 2
  }

    method bulto() {
      return self.bultosSegunCantidad()
  }

  method bultosSegunCantidad() {
    if (cantLadrillos.between(1, 100)){
        return 1
    }else if (cantLadrillos.between(101, 300)) {
        return 2
    }else{
        return 3
      }
  }

  method cambiar() {
    cantLadrillos += 12
  }
}

object arena {
  var peso = 0 

  method peso() {
    return peso
  }
  method nivelPeligrosidad() {
    return 1
  }
    method bulto() {
    return 1
  }

  method cambiar() {
    peso += 20
  }
}

object bateriaAntiaerea {
  var estado = bateriaConOtro 

  method estado(_estado) {
    estado = _estado
  }

  method peso() {
    return estado.peso()
  }

  method nivelPeligrosidad() {
    return estado.nivelPeligrosidad()
  }

    method bulto() {
    return estado.bulto()
  }

  method cambiar() {
    estado = bateriaConMisil
  }
}

object bateriaConMisil {
  
  method peso() {
    return 300
  }

  method nivelPeligrosidad() {
    return 100
  }
    method bulto() {
    return 2
  }
}

object bateriaConOtro {
  method peso() {
    return 200
  }

  method nivelPeligrosidad() {
    return 0
  }
    method bulto() {
    return 1
  }
}

object contenedorPortuario {

  const cosas = []
  
  method peso() {
    return 100 + cosas.sum({cosa => cosa.peso()})
  }

  method nivelPeligrosidadPorCosa() {
    return cosas.map({cosa => cosa.nivelPeligrosidad()})
  }
    method nivelPeligrosidad() {
      
    return self.nivelPeligrosidadPorCosa().maxIfEmpty({0})
  }

  method agregarCosa(cosa) {
    cosas.add(cosa)
  }

  method bulto() {
     return 1 + cosas.map({cosa => cosa.bulto()}) 
  }

  method cambiar() {
    cosas.map({cosa => cosa.cambiar()})
  }

}

object residuosRadiactivos {
  
  var peso = 0

  method peso() {
    return peso
  }

  method nivelPeligrosidad() {
    return 200
  }
    method bulto() {
    return 1
  }

  method cambiar() {
    peso += 15
  }
}

object embalajeSeguridad {
  var property envuelveA = arena 

  method peso() {
    return envuelveA.peso()
  }

  method nivelPeligrosidad() {
    return envuelveA.nivelPeligrosidad() / 2
  }

    method bulto() {
    return 2
  }

  method cambiar() {
    //No hace nada. 
  }

}




//Bumblebee -> robot y auto son objetos
//NUNCA PREGUNTO en que estado esta