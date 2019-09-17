package aplicationRunnable

import dominioUiGastosModel.Movimiento
import dominioUiGastosModel.RepositorioMovimiento
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext

class MovimientoBoostrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(Movimiento, new RepositorioMovimiento)

	}

	override run() {
		val RepositorioMovimiento repositorioMovimiento = ApplicationContext.instance.
			getSingleton(Movimiento) as RepositorioMovimiento

		repositorioMovimiento => [
			create(new Movimiento => [descripcion = "cuchara" monto = -500])
			create(new Movimiento => [descripcion = "cine" monto = -300])
			create(new Movimiento => [descripcion = "sueldo" monto = 5000])
			create(new Movimiento => [descripcion = "extra" monto = 900])
			montoMaximo = -300
		]
	}
}
