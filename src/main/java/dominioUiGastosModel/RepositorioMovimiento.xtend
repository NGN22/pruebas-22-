package dominioUiGastosModel

import dominioUiGastosModel.Movimiento
import java.util.List
import org.apache.commons.collections15.Predicate
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.CollectionBasedRepo
import org.uqbar.commons.model.annotations.Observable

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

	/*
	 * 
	 */
	override protected Predicate<Movimiento> getCriterio(Movimiento example) {
		null
	}

}
