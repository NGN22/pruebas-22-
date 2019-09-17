package dominioUiGastosModel

import java.time.LocalDate
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.applicationContext.ApplicationContext
import org.uqbar.commons.model.annotations.Observable
import org.uqbar.commons.model.exceptions.UserException
import org.uqbar.commons.model.utils.ObservableUtils

@Accessors
@Observable
class VistaPrincipalGastosModel {

	Movimiento movimiento = new Movimiento
	List<Movimiento> gastos
	double saldo
	LocalDate fechaDesde
	LocalDate fechaHasta
	Movimiento seleccionado

	def getActualizar() {
		gastos = repositorio.allInstances
		saldo = repositorio.saldo
	}

	def RepositorioMovimiento getRepositorio() {
		ApplicationContext.instance.getSingleton(typeof(Movimiento))
	}

	def agregarIngreso() {
		getVerificarIngresoDescripccionMonto
	}

	def agregarGasto() {
		movimiento =>[monto = monto * -1]
		getVerificarIngresoDescripccionMonto		
		
	}
	
	def getVerificarIngresoDescripccionMonto() {
		if (movimiento.descripcion === null || verificarMonto)
			throw new UserException("El valor ingresado tiene que tener descripcion y monto")
		else
			repositorio.create(movimiento)
		ObservableUtils.firePropertyChanged(this, "gastos", actualizar)
		movimiento = new Movimiento
	}
	
	def verificarMonto(){
		(movimiento.monto == 0 || movimiento.monto == -0)
	}
	
	def montoSobrepasaElMaximo(double c) {
		c <= repositorio.montoMaximo
	}
	
	def filtrarGastosRepositorio(){
		repositorio.search(fechaDesde,fechaHasta)
	}
	
	def getFiltrarGastos() {
		gastos = filtrarGastosRepositorio
		ObservableUtils.firePropertyChanged(this, "gastos", filtrarGastosRepositorio)
	}


}
