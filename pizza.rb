require "./item.rb"

class Pizza
    @@pizza = []

    def self.set_item(item)
        @@pizza.push(item)
    end

    def self.get_All()
        @@pizza
    end
end