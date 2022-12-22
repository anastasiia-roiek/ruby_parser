require 'open-uri'
require 'byebug'
require 'nokogiri'
require 'csv'
require 'json'
require './pizza.rb'
require './item.rb'

class Cart

    def save_to_csv()
        path_csv = './pizza_csv.csv'
        pizza = Pizza.get_All()
        begin  
            File.new(path_csv, "w")
            
            CSV.open(path_csv, "w", headers: ['Id', 'Name', 'Price', 'Description'], write_headers: true) do |csv|
                pizza.each do |product|
                    csv << [product.id, product.name, product.price, product.description]
                end
            end

            puts "Successfully writen in the csv file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the csv file for writing"
        end
    end

    def save_to_json()
        path_json = './pizza_json.json'
        pizza = Pizza.get_All()
        temp_hash = []
        begin 
            File.new(path_json, "w")

                pizza.each do |product|
                    temp_hash.push({
                        Id: product.id,
                        Name: product.name,
                        Price: product.price,
                        Description: product.description
                    })

                File.open(path_json, "w") do |json|
                    json.write(JSON.pretty_generate(temp_hash))
                end
            end
        end

            puts "Successfully writen in the json file"
        rescue StandardError => e
            puts e.message
            puts "Can not open the json file for writing"
        end
    end