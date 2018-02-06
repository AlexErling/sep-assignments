# DEF nearest possible neighbor(graph_of_cities, current_city)
# WHILE current_city.visited IS FALSE
# SET neighbor_cities TO current_city.neighbors
# SET next_city = neighbor_cities[0]
#
# FOR current_neighbor IN neighbor_cities
# IF current_neighbor.distance < next_city.distance
# ASSIGN current_neighbor TO next_city
# END IF
# END FOR
# SET current_city.visited to TRUE
# ASSIGN next_city TO current_city
# END WHILE
# END DEF

require_relative 'city'

def city_distance( city1, city2)
  Math.hypot(city1.x - city2.x, city2.y - city2.y)
end

def nearest_neighbor(graph_of_cities, current_city)
    route = []
    until graph_of_cities[0].nil?
      next_city = graph_of_cities[0]
      graph_of_cities.each do |option|
        if city_distance(current_city, next_city) > city_distance(current_city, option)
          next_city = option
        end
      end
      current_city = next_city
      graph_of_cities.delete(next_city)
      route.push(current_city.name)

    end
    return route
    puts "Finished"
  end

  austin = City.new("Austin", 10, 10)
  dallas = City.new("Dallas",11, 15)
  houston = City.new("Houston", 7, 2)
  waco =  City.new("Waco", 11, 13)
  frisco = City.new("Frisco", 12, 16)
  el_paso = City.new("El Paso", 0, 5)
  galveston = City.new("Galveston", 6, 1)

  city_graph= [austin, dallas, houston,  waco, frisco, el_paso, galveston]
  trip_route = nearest_neighbor(city_graph, austin)
  puts trip_route
