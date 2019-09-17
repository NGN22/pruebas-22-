package dominioUiGastosModel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.Entity
import org.uqbar.commons.model.annotations.Observable
import java.time.LocalDate

@Accessors
@Observable
class Movimiento extends Entity {
	String descripcion
	double monto
	LocalDate fecha
	
	new(){
		fecha = LocalDate.now()
	}
}
