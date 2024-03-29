package dominioUiGastosModel

import dominioUiGastosModel.Movimiento
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable
import java.time.LocalDate

@Accessors
@Observable
class RepositorioMovimiento extends CollectionBasedRepo<Movimiento> {

	double montoMaximo

	def List<Movimiento> getMovimientos() {
		allInstances
	}

	def Movimiento get(String descripcion) {
		movimientos.findFirst[modelo|modelo.descripcion.equals(descripcion)]
	}

	def getSaldo() {
		movimientos.fold(0.0, [acumulador, movimiento|movimiento.getMonto() + acumulador])
	}

	override createExample() {
		new Movimiento
	}

	override Class<Movimiento> getEntityType() {
		typeof(Movimiento)
	}

	def search(LocalDate primero, LocalDate segundo) {
		allInstances.filter[mov|this.entreFechas(primero, segundo, mov.fecha)].toList
	}

	def entreFechas(LocalDate primero, LocalDate segundo, LocalDate fechaMov) {
		if(criterioFechas(primero, segundo, fechaMov)) true else false
	}

	def criterioFechas(LocalDate date, LocalDate date2, LocalDate date3) {
		date3 >= date && date3 <= date2
	}

	/*
	 * 
	 */
	override protected Predicate<Movimiento> getCriterio(Movimiento example) {
		null
	}

}
