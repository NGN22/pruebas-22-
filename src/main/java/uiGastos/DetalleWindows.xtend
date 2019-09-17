package uiGastos

import dominioUiGastosModel.Movimiento
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.HorizontalLayout

class DetalleWindows extends Dialog<Movimiento> {

	new(WindowOwner owner, Movimiento model) {
		super(owner, model)
	}

	override protected createFormPanel(Panel mainPanel) {
		this.title = "Detalles Gastos"
		val contenedorElementos = new Panel(mainPanel).layout = new HorizontalLayout
		val elementosDerecha = new Panel(contenedorElementos)
		val elementosIzquierda = new Panel(contenedorElementos)

		construccionElementosDerecha(elementosIzquierda)
		construccionElementosIzquierda(elementosDerecha)

	}

	def construccionElementosIzquierda(Panel panel) {
		armarTextLabel(panel, "Descripcion: ")
		armarTextLabel(panel, "Monto: ")
		armarTextLabel(panel, "Fecha: ")
	}

	def construccionElementosDerecha(Panel panel) {
		armarLabel(panel, "descripcion")
		armarLabel(panel, "monto")
		armarLabelFecha(panel, "fecha")
	}

	def armarLabelFecha(Panel panel, String nombreBinding) {
		new Label(panel) => [
			( value <=> nombreBinding ).transformer = new LocalDateTransformer
		]
	}

	def protected armarTextLabel(Panel panel, String nombreLabel) {
		new Label(panel).text = nombreLabel
	}

	def protected armarLabel(Panel panel, String nombreBinding) {
		new Label(panel) => [
			value <=> nombreBinding
		]
	}

}
