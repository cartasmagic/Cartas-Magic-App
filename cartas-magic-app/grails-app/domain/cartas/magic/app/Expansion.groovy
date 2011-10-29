package cartas.magic.app

/**
 * An expansion is a set of cards. All cards belong to an expansion.
 * 
 * @author gastonortiz@gmail.com
 */
class Expansion {
	static hasMany = [cards: Card]

	static constraints = {
		
	}
	String symbol
	String name
}
