object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumbleBee {
  
  var property estadoActual = auto
  
  method peso() {
	return 800
  }

  method nivelPeligrosidad(_estadoActual) {
	return estadoActual.nivelPeligrosidad()
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
}

object arena {
  var property peso = 0 

  method nivelPeligrosidad() {
    return 1
  }
}

object bateriaAntiaerea {
  var estado = bateriaConMisil 

  method estado(_estado) {
    estado = _estado
  }

  method peso() {
    return estado.peso()
  }

  method nivelPeligrosidad() {
    return estado.nivelPeligrosidad()
  }

}

object bateriaConMisil {
  
  method peso() {
    return 300
  }

  method nivelPeligrosidad() {
    return 100
  }
}

object bateriaConOtro {
  method peso() {
    return 200
  }

  method nivelPeligrosidad() {
    return 0
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
}

object residuosRadiactivos {
  
  var property peso = 0

  method nivelPeligrosidad() {
    return 200
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

}




//Bumblebee -> robot y auto son objetos
//NUNCA PREGUNTO en que estado esta