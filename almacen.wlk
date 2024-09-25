import cosas.*
import camion.*

object almacen {
  const property cosas = #{}
  var property capacidad = 0

    method almacenar(unaCosa) {
      cosas.add(unaCosa)
    }
    
    method haySuficienteCapacidad(carga) {
      return carga.totalBultos() < capacidad
    }

    method validarDescarga(carga) {
      if (not self.haySuficienteCapacidad(carga)){
        self.error("El almacen no puede recibir la carga 
                    porque supera su capacidad de almacenamiento!!")
      }
    }

    method bajarCarga(carga) {
      self.validarDescarga(carga) //Si hay capacidad, descarga
      //Sino, da error y corta el flujo de ejecucion.
      carga.forEach({cosa => self.almacenar(cosa)})
    }
}

