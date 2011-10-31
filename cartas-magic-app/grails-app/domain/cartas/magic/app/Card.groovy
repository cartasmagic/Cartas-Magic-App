package cartas.magic.app

/**
 * Domain class representing a card.<br>
 * A card can be either a Land, a Creature, an Enchantment, an Instant, a Sorcery, an Artifact or a Planeswalker.
 *  
 * @author gastonortiz@gmail.com
 */
class Card {
	
	static belongsTo = [Expansion]

	static constraints = {
		
	}

	String manaCost
	BigDecimal price
	String name
	String image
	String description
	def types = []
	def subtypes = []
}
