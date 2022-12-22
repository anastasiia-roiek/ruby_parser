class Item
    attr_accessor :id, :name, :price, :description, :img_link

    def initialize(id = 0, name ='', price = 0, description = '', img_link = '')
        @id = id
        @name = name
        @price = price
        @description = description
        @img_link = img_link
    end

    def to_s()
        "id=#@id, name=#@name, price=#@price, description=#@description, img_link=#@img_link"
    end

    def to_h()
        {'id' => @id, 'name'=> @name, 'price' => @price, 'description' => @description, 'img_link' => @img_link}
    end

    def info()
        yield
    end

end