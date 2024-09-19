import cosas.*
import camion.*

object almacen {
  const property cosas = #{}

    method almacenar(unaCosa) {
      cosas.add(unaCosa)
    }

    method bajarCarga(carga) {
      carga.map({cosa => self.almacenar(cosa)})
    }
}

