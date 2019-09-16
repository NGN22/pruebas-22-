package aplicationRunnable

import org.uqbar.arena.Application
import org.uqbar.arena.windows.Window
import dominioUiGastosModel.VistaPrincipalGastosModel
import uiGastos.VistaPrincipalGastosWindow

class AplicationRunnable extends Application {

	new(MovimientoBoostrap bootstrap) {
		super(bootstrap)
	}

	static def main(String [] args) {
		new AplicationRunnable(new MovimientoBoostrap).start()

	}

	override protected Window<?> createMainWindow() {
		return new VistaPrincipalGastosWindow(this,new VistaPrincipalGastosModel)
	}

}
