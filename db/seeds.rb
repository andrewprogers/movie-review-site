# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Helper methods
def search_for_movie(title)
  uri = URI("http://www.omdbapi.com/?t=#{title}&apikey=#{ENV['OMDB_API_KEY']}")
  response = JSON.parse(Net::HTTP.get(uri))
  if response["Response"] == "False"
    return false
  else
    return response
  end
end

def poster_url(imdb_id)
  height = 400
  "http://img.omdbapi.com/?i=#{imdb_id}&h=#{height}&apikey=#{ENV['OMDB_API_KEY']}"
end

# Create users
user_values = [
  ['Andrew', 'Rogers', 'andrewprogers', 'andrewprogers@gmail.com', '1234567', true],
  ['George', 'Gilmer', 'georgegilmer', 'george.gilmer@gmail.com', '1234567', true],
  ['Mike', 'Lattanzio', 'mikelattanzio', 'juugisidia@gmail.com', '1234567', true],
  ['Sathvik', 'Sudireddy', 'sathviksudireddy', 'sathviksudireddy@yahoo.com', '12345678', true],
  ['Other', 'User', 'otheruser', 'otheruser@gmail.com', '1234567', false],
]

user_values.each do |user|
  if User.where(email: user[3]).length === 0
    new_user = {
      first_name: user[0],
      last_name: user[1],
      username: user[2],
      email: user[3],
      password: user[4],
      password_confirmation: user[4],
      admin: user[5]
    }
    User.create(new_user)
  end
end
users = User.all

movie_names = [
  "The Departed",
  "The Boondock Saints",
  "Spotlight",
  "The Town",
  "Gone Baby Gone",
  "Good Will Hunting",
  "My Neighbor Totoro",
  "The Fighter",
  "Shutter Island",
  "Fever Pitch",
  "Legally Blonde",
  "21",
  "Black Mass",
  "Spirited Away",
  "Princess Mononoke",
  "Howl's Moving Castle",
  "Kiki's Delivery Service",
  "The Grand Budapest Hotel",
  "The Darjeeling Limited",
  "Moonrise Kingdom",
  "The Royal Tenenbaums",
  "Rushmore",
  "The Life Aquatic",
  "John Wick",
  "The Matrix",
  "The Thing",
  "Vertigo",
  "Rosemary's Baby",
  "Trainspotting",
  "Jurassic Park",
  "Blade Runner",
  "A Clockwork Orange",
  "American Beauty",
  "Jaws",
  "Atack of the 50 Foot Woman",
  "Apocalypse Now",
  "Taxi Driver",
  "Back to the Future",
  "The Shining",
  "Full Metal Jacket",
  "Scent of a Woman",
  "22 Jump Street",
  "Guardians of the Galaxy",
  "The Godfather",
  "One Flew over the Cuckoos Nest",
  "Tropic Thunder",
  "Good Will Hunting",
  "How to Lose a Guy in 10 days",
  "Finding Nemo",
  "Moana",
  "The Nice Guys",
  "Goodfellas",
  "Troll 2",
  "The Garbage Patch Kids",
  "Fear and Loathing in Las Vegas",
  "Rocky",
  "Rocky 2",
  "Rocky 3",
  "Rocky 4",
  "Rocky 5",
  "Happy Gilmore"
]

movie_names.each do |title|
  if Movie.where(name: title).length == 0
    externalMovie = search_for_movie(title)
    if externalMovie
      imdbID = externalMovie["imdbID"]
      description = externalMovie["Plot"]
      remote_poster_url = poster_url(imdbID)
      Movie.create!(user: users.sample, name: title, description: description, imdbID: imdbID, remote_poster_url: remote_poster_url)
    end
  end
end
movies = Movie.all

# Create reviews
review_bodies = [
  "This movies was really well acted! I just love the way the actors acted their roles. I almost believed the actors were the people they were pretending to be. Really, just amazing good stuff. Loved it.",
  "Fantastic, I was on the edge of my seat. Totally, like the whole time. I almost fell off. Really, I think they could stand to make the seats a little longer. The movie was too exciting for a small seat.",
  "It was just ok... I don't see what all the hype is about. I mean, it was pretty good for what it is, but it isn't really all that different or interesting or anything. It defiinitley won't win any awards",
  "It was a real waste of my time for sure. I could have done so many other things with my day, but I chose to go see this movie and it really wasn't worth it. Go do something else, ok?",
  "This movie was total junk",
  '1.5 thumbs up',
  "Woooo Boston!!!",
  "First",
  ""
]

30.times do |idx|
  rating = (idx % 5) + 1
  new_review = {
    rating: rating,
    body: review_bodies.sample,
    user: users.sample,
    movie: movies.sample
  }
  Review.find_or_create_by(new_review)
end
