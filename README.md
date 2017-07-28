![Build Status](https://codeship.com/projects/38d83730-4d42-0135-ea45-72e8c5ccfe37/status?branch=master)
![Code Climate](https://codeclimate.com/github/andrewprogers/movie-review-site.png)
![Coverage Status](https://coveralls.io/repos/andrewprogers/movie-review-site/badge.png)

# README

## Introduction

We wanted to create an awesome site for reviewing your favorite movies. As a user on the site, you can add movies and reviews and even upvote or downvote reviews. Due to the sheer volume of movies, a user can use the search bar to find their favorite movies. When a review is added to a movie you added, you will be sent a persoanlized email that also includes some recent news from the 38 Stahs team. This site is monitored by the admins and if any review is deemed inappropriate or otherwise against the core values of the 38 Stahs team, the review will be deleted. In extreme cases, a user's account may even be terminated. As a user, you can also personalize your profile with a unique username and profile picture. We at the 38 Stahs team believe this kind of personalization will bring our little community together in new and exciting ways. If you visit the root page of our site, you will see a real-time auto-updating page of the most recent reviews.

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
We used Mailgun for our email functionality. (More on technologies)

## Prerequisites
You will need to install ImageMagick by running `brew install imagemagick`

## Testing
To run your test suite, exectue `rake` in your terminal.

## Deployment
We've deployed our site on Heroku. You can visit our site via this url: https://thirty-eight-stahs.herokuapp.com/
(We need deploment instructions)

## Authors/Contributors
Andrew Rogers, George Gilmer, Mike Lattanzio, Sathvik Sudireddy

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
