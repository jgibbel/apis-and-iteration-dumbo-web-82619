require 'rest-client'
require 'json'
require 'pry'

# def new_page(url)
#   JSON.parse(RestClient.get(url))
# end



# def shovel_char(hash)
#   hash['results'].each do |hash| 
#     full_char_info  << hash
#   end
# end

def get_character_movies_from_api(character_name)
  char_info = nil
  ten_char = JSON.parse(RestClient.get('http://www.swapi.co/api/people/'))
  while !char_info
    char_info = ten_char['results'].each.find {|hash| hash['name'].downcase == character_name} # nil or char hash
    if ten_char['next']
      ten_char = JSON.parse(RestClient.get(ten_char['next']))
    else
      if !char_info
        puts 'Charater not in Universe.'
        return nil
      else
        char_info
      end
    end
  end
  film_info = []
  char_info['films'].each do |url|
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
  #binding.pry
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
    puts "#{index+1}) #{hash["title"]}, directed by #{hash['director']}, released in #{hash['release_date'][0,4]}"
  end

end

def show_character_movies(character)
  if get_character_movies_from_api(character)
    films = get_character_movies_from_api(character)
  else return nil
  end
  print_movies(films)
end

#get_character_movies_from_api("Han Solo")
#test_all_people()
#test_film_data()
## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
