package uiGastos

import java.time.LocalDate
import java.time.format.DateTimeFormatter
import java.time.format.DateTimeParseException
import org.apache.commons.lang.StringUtils
import org.uqbar.arena.bindings.ValueTransformer
import org.uqbar.commons.model.exceptions.UserException

class LocalDateTransformer implements ValueTransformer<LocalDate, String> {
	String pattern = "dd/MM/yyyy"
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern)

	override viewToModel(String valueFromView) {
		try {
			if (StringUtils.isBlank(valueFromView)) null else LocalDate.parse(valueFromView, formatter)
		} catch (DateTimeParseException e) {
			// TODO: i18n
			throw new UserException("Debe ingresar una fecha en formato: " + this.pattern)
		}
	}
	
	override getModelType() { LocalDate }
	
	override getViewType() { String	}
	
	override modelToView(LocalDate valueFromModel) {
		if (valueFromModel === null) return null else valueFromModel.format(formatter)
	}
	
}
