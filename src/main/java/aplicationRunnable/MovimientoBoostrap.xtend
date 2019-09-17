package aplicationRunnable

import dominioUiGastosModel.Movimiento
import dominioUiGastosModel.RepositorioMovimiento
import org.uqbar.arena.bootstrap.CollectionBasedBootstrap
import org.uqbar.commons.applicationContext.ApplicationContext
import java.time.LocalDate

class MovimientoBoostrap extends CollectionBasedBootstrap {

	new() {
		ApplicationContext.instance.configureSingleton(Movimiento, new RepositorioMovimiento)

	}

	override run() {
		val RepositorioMovimiento repositorioMovimiento = ApplicationContext.instance.
			getSingleton(Movimiento) as RepositorioMovimiento

		repositorioMovimiento => [
			create(new Movimiento => [descripcion = "cuchara" monto = -500 fecha = LocalDate.of(2019,8,2)])
			create(new Movimiento => [descripcion = "cine" monto = -300 fecha = LocalDate.of(2019,8,3)])
			create(new Movimiento => [descripcion = "sueldo" monto = 5000 fecha = LocalDate.of(2019,8,4)])
			create(new Movimiento => [descripcion = "extra" monto = 900 fecha = LocalDate.of(2019,8,5)])
			montoMaximo = -300
		]
	}
}
