def welcome
  # puts out a welcome message here!
  puts "Welcome to Star Wars: The Database"
end

def get_character_from_user
  puts "Please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  gets.chomp
end
