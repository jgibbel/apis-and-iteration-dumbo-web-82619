require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  
  char_hash = response_hash['results'].each.find do |hash|
    hash['name'] == character_name
  end
  film_info = []
  char_hash['films'].each do |url|
    film_info << JSON.parse(RestClient.get(url))
  end  
  film_info
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
 
end

def test_all_people()
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  puts response_hash
  binding.pry
  0
end

def test_film_data()
  response_string = RestClient.get('https://www.swapi.co/api/people')
  response_hash = JSON.parse(response_string)
  binding.pry
  0

end

def print_movies(films)
  puts "*"*25
  films.each_with_index do |hash, index|
    puts "#{index+1}) #{hash["title"]}"
  end

end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

 test_all_people()
#test_film_data()
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
