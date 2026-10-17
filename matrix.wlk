object neo{
    var energia = 100

    method esElElegido() = true 
    method saltar() {
      energia = energia / 2
    }
    method vitalidad() = energia / 10
}

object morfeo {
  var vitalidad = 8
  var cansado = false

  method esElElegido() = false
  method vitalidad() = vitalidad
  method cansado() = cansado 
  method saltar() {
    if(not cansado){
        cansado = true
    }
    else{
        cansado = false
    }
    vitalidad -= 1
  }
}

object trinity {
  method vitalidad() = 0
  method esElElegido() = false  
}

object nave {
  const pasajeros = [neo, morfeo, trinity]

  method cantDePasajeros() = pasajeros.size()
  method pasajeroMayorVitalidad() = pasajeros.max({p => p.vitalidad()})
  method estaEquilibradaEnVitalidad(){
    return self.pasajeroMayorVitalidad().vitalidad() <= pasajeros.min({p => p.vitalidad()}).vitalidad()*2
  }

  method chocar() {
    pasajeros.forEach({p => p.saltar()})
    pasajeros.clear()
  }

  method acelerar() {
    pasajeros.filter({p => not p.esElElegido()}).forEach({p => p.saltar()})

  }
}