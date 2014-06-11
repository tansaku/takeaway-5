require_relative 'customer'

class Restaurant

	attr_accessor :menu

	def initialize
		@menu ||= []
		@orders ||= []
	end

	def create_dish(name, price)
		menu << {name: name, price: price}
	end

	def delete_dish(name)
		menu.delete_if { |item| item[:name] == name }
	end

	def display_menu
		print menu_contents
	end

	def menu_contents
		menu.map { |dish| "#{dish[:name]} : £#{price_for(dish)}" }.join("\n")
	end

# when running this method alone, error 'no implicit conversion of symbol to integer'
	def price_for(dish)
		sprintf("%0.2f", dish[:price])
	end

	def order_received(customer, name, volume)
		if @menu.any? { |h| h[:name] == name}
		@orders << [customer, name, volume]
		else
			customer.not_on_menu(name)
		end
	end

	


end

