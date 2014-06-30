require 'json'

module GetSeated
  class RestaurantData

    def self.readjson
      file = (File.read(Rails.root.to_s+'/db/restaurants.json'))
      JSON.parse(file)
    end

    def self.parse_data
      data = readjson
      rest_arr = []
      data['data'].each do |item|
        url = item['url'].is_a?(Array) ? item['url'][0] : ""
        photo = item['photo'].is_a?(Array) ? item['photo'][0] : ""
        phone = item['phone'].is_a?(Array) ? item['phone'][0] : ""
        cuisine = item['cuisine'].is_a?(Array) ? item['cuisine'][0] : ""
        price = item['price'].is_a?(Array) ? item['price'][0] : ""
        res = { name: item['name'][0],
            phone: phone,
            address: item['address'][0],
            url: url,
            price: price,
            cuisine: cuisine,
            photo_url: photo
          }
          rest_arr << res
      end
      return rest_arr
    end

    def self.save_data
      rest_data = parse_data
      rest_data.each do |restaurnat|
        Restaurant.create(
          :name => restaurnat[:name],
          :phone => restaurnat[:phone],
          :address => restaurnat[:address],
          :url => restaurnat[:url],
          :price => restaurnat[:price],
          :cuisine => restaurnat[:cuisine],
          :photo_url => restaurnat[:photo_url],
          :capacity => 100)
      end
    end

  end
end