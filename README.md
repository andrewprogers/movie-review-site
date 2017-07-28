![Build Status](https://codeship.com/projects/38d83730-4d42-0135-ea45-72e8c5ccfe37/status?branch=master)
![Code Climate](https://codeclimate.com/github/andrewprogers/movie-review-site.png)
![Coverage Status](https://coveralls.io/repos/andrewprogers/movie-review-site/badge.png)

# README

## Introduction

We wanted to create an awesome site for reviewing your favorite movies. As a user on the site, you can add movies and reviews and even upvote or downvote reviews. Due to the sheer volume of movies, a user can use the search bar to find their favorite movies. When a review is added to a movie you added, you will be sent a persoanlized email that also includes some recent news from the 38 Stahs team. As a user, you can also personalize your profile with a unique username and profile picture. We at the 38 Stahs team believe this kind of personalization will bring our little community together in new and exciting ways. If you visit the root page of our site, you will see a real-time auto-updating page of the most recent reviews.

## Getting Started

To clone and run this repo on your local machine, follow these steps.
1) On your terminal, run `git clone https://github.com/andrewprogers/movie-review-site.git`
Then execute the following commands
2) `bundle install`
3) `yarn`
4) `rake db:create`
5) `rake db:migrate`
Run the following servers on sepearate terminal tabs
6) `rails s`
7) `./bin/webpack-dev-server`
And with that, you can view the site on localhost:3000

## Technologies
- React live feed of the most recent reviews
- Mailgun to send notifications when reviews are commented on
- Integration with the Open Movie Database (OMDB) to retrieve movie information and posters
- Carrierwave and Fog to handle image uploads to Amazon Web Services
- Devise to handle user authentication

## Prerequisites
You will need to install ImageMagick by running `brew install imagemagick`

## Testing
Run 'rake' to execute ruby tests, and `karma start` to execute javascript tests.

## Deployment
We've deployed our site on Heroku. You can visit our site via this url: https://thirty-eight-stahs.herokuapp.com/

To deploy a copy of this app, you'll need to setup the following:
- Heroku account
- Mailgun account
- Amazon Web services with production S3 bucket
- OMDB API key
- .env file in the root directory with secret keys for the above accounts

The app includes a seed file for the database to introduce users and movies. You can modify the array of movie titles to set which movies are imported on setup.

## Authors/Contributors
- [Andrew Rogers](https://github.com/andrewprogers/)
- [George Gilmer](https://github.com/Geoooorge)
- [Mike Lattanzio](https://github.com/learnthecraft617)
- [Sathvik Sudireddy](https://github.com/sathvik22)
