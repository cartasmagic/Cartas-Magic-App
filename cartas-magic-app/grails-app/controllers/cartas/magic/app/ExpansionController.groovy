package cartas.magic.app

/**
 * Controller that handles {@link Expansion} calls.
 * 
 * @author gastonortiz@gmail.com
 */
class ExpansionController {

	/**
	 * Redirects to the screen that lists all the {@link Expansion}s.
	 */
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[expansions: Expansion.list(params)]
	}
	
	/**
	 * Redirects to the screen that creates an {@link Expansion}.
	 */
	def create = {
		def expansion = new Expansion()
		expansion.properties = params
		return [expansion: expansion]
	}

	/**
	 * Saves an {@link Expansion}.
	 */
	def save = {
		def expansion = new Expansion(params)
		if (expansion.save(flush: true)) {
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'expansion.label', default: 'Expansion'), expansion.id])}"
			redirect(action: "show", id: expansion.id)
		} else {
			render(view: "create", model: [expansion: expansion])
		}
	}

	/**
	 * Shows an {@link Expansion}.
	 */
	def show = {
		def expansion = Expansion.get(params.id)
		if (!expansion) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expansion.label', default: 'Expansion'), params.id])}"
			redirect(action: "list")
		}
		else {
			render(view: "show", model:[expansion: expansion])
		}
	}

	def edit = {
		def expansion = Expansion.get(params.id)
		if (!expansion) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expansion.label', default: 'Expansion'), params.id])}"
			redirect(action: "list")
		}
		else {
			return [expansion: expansion]
		}
	}

	def update = {
		def expansion = Expansion.get(params.id)
		if (expansion) {
			if (params.version) {
				def version = params.version.toLong()
				if (expansion.version > version) {

					expansion.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'expansion.label', default: 'Expansion')]
					as Object[], "Another user has updated this Expansion while you were editing")
					render(view: "edit", model: [expansion: expansion])
					return
				}
			}
			expansion.properties = params
			if (!expansion.hasErrors() && expansion.save(flush: true)) {
				flash.message = "${message(code: 'default.updated.message', args: [message(code: 'expansion.label', default: 'Expansion'), expansion.id])}"
				redirect(action: "show", id: expansion.id)
			}
			else {
				render(view: "edit", model: [expansion: expansion])
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expansion.label', default: 'Expansion'), params.id])}"
			redirect(action: "list")
		}
	}

	def delete = {
		def expansion = Expansion.get(params.id)
		if (expansion) {
			try {
				expansion.delete(flush: true)
				flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'expansion.label', default: 'Expansion'), params.id])}"
				redirect(action: "list")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'expansion.label', default: 'Expansion'), params.id])}"
				redirect(action: "show", id: params.id)
			}
		}
		else {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'expansion.label', default: 'Expansion'), params.id])}"
			redirect(action: "list")
		}
	}

}
