# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create users
user_values = [
  ['Andrew', 'Rogers', 'andrewprogers', 'andrewprogers@gmail.com', '1234567', true],
  ['George', 'Gilmer', 'georgegilmer', 'george.gilmer@gmail.com', '1234567', true],
  ['Mike', 'Lattanzio', 'mikelattanzio', 'juugisidia@gmail.com', '1234567', true],
  ['Other', 'User', 'otheruser', 'otheruser@gmail.com', '1234567', false],
]

user_values.each do |user|
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
users = User.all

# Create Movies
movie_values = [
  ["The Departed", "South Boston cop Billy Costigan (Leonardo DiCaprio) goes under cover to infiltrate the organization of gangland chief Frank Costello (Jack Nicholson). As Billy gains the mobster's trust, a career criminal named Colin Sullivan (Matt Damon) infiltrates the police department and reports on its activities to his syndicate bosses. When both organizations learn they have a mole in their midst, Billy and Colin must figure out each other's identities to save their own lives."],
  ["The Boondock Saints", "Tired of the crime overrunning the streets of Boston, Irish Catholic twin brothers Conner (Sean Patrick Flanery) and Murphy (Norman Reedus) are inspired by their faith to cleanse their hometown of evil with their own brand of zealous vigilante justice. As they hunt down and kill one notorious gangster after another, they become controversial folk heroes in the community. But Paul Smecker (Willem Dafoe), an eccentric FBI agent, is fast closing in on their blood-soaked trail."],
  ["Spotlight", "In 2001, editor Marty Baron of The Boston Globe assigns a team of journalists to investigate allegations against John Geoghan, an unfrocked priest accused of molesting more than 80 boys. Led by editor Walter 'Robby' Robinson (Michael Keaton), reporters Michael Rezendes (Mark Ruffalo), Matt Carroll and Sacha Pfeiffer interview victims and try to unseal sensitive documents. The reporters make it their mission to provide proof of a cover-up of sexual abuse within the Roman Catholic Church."],
  ["The Town", "Doug MacRay (Ben Affleck) leads a band of ruthless bank robbers and has no real attachments except for James (Jeremy Renner), who -- despite his dangerous temper -- is like a brother. Everything changes for Doug when James briefly takes a hostage, bank employee Claire Keesey. Learning that she lives in the gang's neighborhood, Doug seeks her out to discover what she knows, and he falls in love. As the romance deepens, he wants out of his criminal life, but that could threaten Claire."],
  ["Gone Baby Gone", "Along with his girlfriend (Michelle Monaghan), a private detective (Casey Affleck) takes on the difficult task of searching for a kidnapped girl in Boston. During his investigation, he must deal with the girl's aunt, a disapproving lawman (Morgan Freeman) and a drug dealer."],
  ["Good Will Hunting", "Will Hunting (Matt Damon) has a genius-level IQ but chooses to work as a janitor at MIT. When he solves a difficult graduate-level math problem, his talents are discovered by Professor Gerald Lambeau (Stellan Skarsgard), who decides to help the misguided youth reach his potential. When Will is arrested for attacking a police officer, Professor Lambeau makes a deal to get leniency for him if he will get treatment from therapist Sean Maguire (Robin Williams)."]
]


movie_values.each do |movie|
  Movie.create(user: users.sample, name: movie[0], description: movie[1])
end
movies = Movie.all

# Create reviews
review_bodies = [
  "This movies was really well acted!",
  "Fantastic, I was on the edge of my seat",
  "It was just ok... I don't see what all the hype is about",
  "It was a real waste of my time for sure",
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
