require './parser.rb'
require './cart.rb'

parser = Parser.new('https://shosho.pizza/category/pizza')
#cart = Cart.new()

parser.parse()
#cart.save_to_csv()
#cart.save_to_json()