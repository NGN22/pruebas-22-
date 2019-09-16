package uiGastos

import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import dominioUiGastosModel.VistaPrincipalGastosModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.tables.Table
import dominioUiGastosModel.Movimiento
import org.uqbar.arena.widgets.tables.Column
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import java.awt.Color
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.lacar.ui.model.transformer.NotEmptyTransformer

class VistaPrincipalGastosWindow extends SimpleWindow<VistaPrincipalGastosModel> {

	new(WindowOwner owner, VistaPrincipalGastosModel model) {
		super(owner, model)
		modelObject.actualizar
	}

	override createContents(Panel mainPanel) {

		this.title = "Mis Gastos"
		new ErrorsPanel(mainPanel, "errores", 1)

		mainPanel => [
			val contenedorElementosArriba = new Panel(mainPanel).layout = new HorizontalLayout
			val muestraMovimiento = new Panel(contenedorElementosArriba).layout = new HorizontalLayout
			val botonesAccion = new Panel(contenedorElementosArriba)
			crearContenidosContenedorArriba(muestraMovimiento)
			addActions(botonesAccion)
			val contenedorElementosAbajo = new Panel(mainPanel)
			crearContenidosContenedorAbajo(contenedorElementosAbajo)
			val contenedorSaldo = new Panel(mainPanel).layout = new HorizontalLayout
			createFormPanel(contenedorSaldo)
		]

	}

	def crearContenidosContenedorArriba(Panel panel) {
		val contenedorDerecho = new Panel(panel)
		val contenedorIzquierdo = new Panel(panel)
		contenedorDerecho => [
			armarTextLabel(contenedorDerecho, "Descripcion: ")
			armarTextLabel(contenedorDerecho, "Monto: ")
		]

		contenedorIzquierdo => [
			armarTextBox(contenedorIzquierdo, "movimiento.descripcion")
			armarTextBox(contenedorIzquierdo, "movimiento.monto")
		]

	}

	def crearContenidosContenedorAbajo(Panel panel) {

		val tabla = new Table(panel, Movimiento) => [
			items <=> [VistaPrincipalGastosModel model|model.gastos]
			numberVisibleRows = 6
		]

		armarColumna(tabla, "Descripcion", "descripcion")
		armarColumna(tabla, "Monto: ", "monto")

	}

	override protected addActions(Panel actionsPanel) {
		new Button(actionsPanel) => [
			caption = "Agregar Ingreso"
			onClick([|
				this.modelObject.agregarIngreso
			])
			setAsDefault
			disableOnError
		]

		new Button(actionsPanel) => [
			caption = "Agregar Gasto"
			onClick([|
				this.modelObject.agregarGasto
			])
			setAsDefault
			disableOnError

		]
	}

	override protected createFormPanel(Panel mainPanel) {
		armarTextLabel(mainPanel,"saldo: ")
		armarLabel(mainPanel,"saldo")
		new Label(mainPanel) => [
			value <=> 'movimiento.descripcion'
		]
		new Label(mainPanel) => [
			value <=> 'movimiento.monto'
		]
				
	}

	def protected armarColumna(Table<Movimiento> tabla, String titulo, String nombreBind) {
		new Column<Movimiento>(tabla) => [
			title = titulo
			bindContentsToProperty(nombreBind)
			fixedSize = 150
		]
	}

	def protected armarTextLabel(Panel panel, String nombreLabel) {
		new Label(panel).text = nombreLabel
	}

	def protected armarLabel(Panel panel, String nombreBinding){
		new Label(panel) => [
			value <=> nombreBinding
		]
	}
	def protected armarTextBox(Panel panel, String nombreBinding) {
		new TextBox(panel) => [
			background = Color.ORANGE
			value <=> nombreBinding
			width = 100
		]
	}

}
