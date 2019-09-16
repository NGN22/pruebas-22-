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
			create("cuchara", -500)
			create("Cine", -300)
			create("Sueldo", 5000)
		]
		val movimiento = new Movimiento => [descripcion = "hola" monto = 900]
		repositorioMovimiento.create(movimiento)

	}
}
