package cartas.magic.app

class CardController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cards: Card.list(params)]
    }

    def create = {
        def cardInstance = new Card()
        cardInstance.properties = params
        return [cardInstance: cardInstance]
    }

    def save = {
        def cardInstance = new Card(params)
        if (cardInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'card.label', default: 'Card'), cardInstance.id])}"
            redirect(action: "show", id: cardInstance.id)
        }
        else {
            render(view: "create", model: [cardInstance: cardInstance])
        }
    }

    def show = {
        def cardInstance = Card.get(params.id)
        if (!cardInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])}"
            redirect(action: "list")
        }
        else {
            render(view: "show", model:[cardInstance: cardInstance])
        }
    }

    def edit = {
        def cardInstance = Card.get(params.id)
        if (!cardInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cardInstance: cardInstance]
        }
    }

    def update = {
        def cardInstance = Card.get(params.id)
        if (cardInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cardInstance.version > version) {
                    
                    cardInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'card.label', default: 'Card')] as Object[], "Another user has updated this Card while you were editing")
                    render(view: "edit", model: [cardInstance: cardInstance])
                    return
                }
            }
            cardInstance.properties = params
            if (!cardInstance.hasErrors() && cardInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'card.label', default: 'Card'), cardInstance.id])}"
                redirect(action: "show", id: cardInstance.id)
            }
            else {
                render(view: "edit", model: [cardInstance: cardInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def cardInstance = Card.get(params.id)
        if (cardInstance) {
            try {
                cardInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'card.label', default: 'Card'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'card.label', default: 'Card'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'card.label', default: 'Card'), params.id])}"
            redirect(action: "list")
        }
    }
}
