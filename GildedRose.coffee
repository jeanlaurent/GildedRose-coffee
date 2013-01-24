class Item
	constructor: (@name, @sellIn, @quality) ->

class Inn
	constructor : ->
		@items = [
			new Item('+5 Dexterity Vest', 10, 20),
			new Item('Aged Brie', 2, 0),
			new Item('Elixir of the Mongoose', 5, 7),
			new Item('Sulfuras, Hand of Ragnaros', 0, 80),
			new Item('Backstage passes to a TAFKAL80ETC concert', 15, 20),
			new Item('Conjured Mana Cake', 3, 6)]

	updateQuality : ->
		i = 0
		while (i < @items.length)
			if (@items[i].name != 'Aged Brie' && !(@items[i].name == 'Backstage passes to a TAFKAL80ETC concert'))
				if (@items[i].quality > 0)
					if @items[i].name isnt 'Sulfuras, Hand of Ragnaros'
						@items[i].quality = @items[i].quality - 1
			else
				if (@items[i].quality < 50)
					@items[i].quality = @items[i].quality + 1

					if (@items[i].name == 'Backstage passes to a TAFKAL80ETC concert')
						if (@items[i].sellIn < 11)
							if (@items[i].quality < 50)
								@items[i].quality = @items[i].quality + 1

						if (@items[i].sellIn < 6)
							if (@items[i].quality < 50)
								@items[i].quality = @items[i].quality + 1

			if (!(@items[i].name is 'Sulfuras, Hand of Ragnaros'))
				@items[i].sellIn = @items[i].sellIn - 1

			if (@items[i].sellIn < 0)
				if (!(@items[i].name is 'Aged Brie'))
					if @items[i].name isnt 'Backstage passes to a TAFKAL80ETC concert'
						if (@items[i].quality > 0)
							if (!(@items[i].name == 'Sulfuras, Hand of Ragnaros'))
								@items[i].quality = @items[i].quality - 1
					else
						@items[i].quality = @items[i].quality - @items[i].quality
				else
					@items[i].quality = @items[i].quality + 1 if (@items[i].quality < 50)
						
			i++

console.log 'OMGAI!'
new Inn().updateQuality()