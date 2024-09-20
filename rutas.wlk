object ruta9 {
  
  method nivelPeligrosidad() {
    return 11
  }

  method pesoSoportado(){
    //Este metodo lo necesito por polimorfismo en la validacion
    //Pero no devuelve nada
  }
}

object caminoVecinal {
  
  var property pesoSoportado = 0

  method nivelPeligrosidad() {
    // esta indicado en algun lado?? 
    // Queda vacio? 
  }

}