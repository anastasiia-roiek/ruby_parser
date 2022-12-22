require 'open-uri'
require 'byebug'
require 'nokogiri'
require './pizza.rb'
require './item.rb'

class Parser

    def initialize(url)
        @url = url
    end

    def parse()
        begin
            html = URI.open(@url) { |result| result.read}
            doc = Nokogiri::HTML(html)
            i = 0
            doc.css('.prod-item').each do |element|
                pizza = Item.new()
                pizza.name = element.css('.prod-name').text
                pizza.description = element.css('.prod-desc').text
                pizza.price = element.css('.prod-price').text.strip
                pizza.id = i+1
                i= i+1
                Pizza.set_item(pizza)
            end
        rescue OpenURI::HTTPError => e
            puts e.message
        end
    end
end