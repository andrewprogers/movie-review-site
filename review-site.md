In this challenge you'll be building a web application in groups of 3-5 developers. The application should allow users to add new items and write reviews for those items. The item for review can be any entity of your choosing (e.g. a review site for restaurants, food trucks, playlists, other review sites, etc.).

Your web application's features will be described as a series of **user stories**. Your job will be write user stories based on each feature. Then, formulate **acceptance criteria** from those user stories. Then, **write tests** based on the acceptance criteria. Finally, you will **write code** to build out each feature and get the tests to pass. Focus on implementing one feature at a time per pair.

The purpose of this project is two-fold:

1. To touch on several of the key features of basic Rails apps, such as authentication, authorization, CRUD functionality for models, sending emails, and search.
2. To learn how to collaborate on an app and use proper TDD and git workflows.

**Expect it to be challenging!** Collaboration can be tough, both organizationally and personally. Treat this project as an opportunity to strengthen your communication and organizational skills. Employers value developers who can communicate well with others and are patient and good-natured with their team members.

### Requirements

At a minimum, you must supply the following functionality:

* The ability to add an item to be reviewed.
* The ability to rate (score on a scale) the item and to optionally comment on it (i.e. write a review).
* The ability to upvote or downvote a review. A user can only upvote or downvote once and can change their vote from up to down. This feature should utilize fetch so that a complete page reload isn't necessary.
* A sign up and authentication system for your users (with [devise](https://github.com/plataformatec/devise)).
* An ability to upload a profile photo (with [CarrierWave](https://github.com/carrierwaveuploader/carrierwave)).
* The ability to search for items.
* An admin role. Admins are able to delete reviews or items if they are deemed to be inappropriate.
* An email is sent to the owner of an item when a new review is posted about it.
* A heavily React.js front end. At a minimum, the index page should be rendered in React and live-update.
* A detailed README file that includes the following: name and brief description of the project, list of authors, Heroku link to deployed site, and list of features included in the site, outline of the technologies in the project.

Each of these features will be described in more detail below, but many of them will require you to do some independent research - read gem documentation, watch RailsCasts, etc. Embrace the challenge! You'll need those research skills as a developer long after Launch Academy.

API Integration is an optional challenge.

### Getting Started Checklist

* With your group, decide what kind of review site you'll be making together.
* Select a group leader and secretary for the day
* Create your group Slack channel, and add the EE staff
* Create an ER Diagram and user stories for your first two features
* Create your new rails app on someone's machine, directions below (but NOT do any further work on it)
* As a team, pick a [version of Ruby](https://www.ruby-lang.org/en/) to build your application on, and add it to a `.ruby-version` file in the root of your project (eg- ruby-2.3.0). Make sure everyone on the team installs this version of Ruby.
* Create a repository on Github, add all group members and EEs as collaborators to it, and push your starting code ("initial commit") up on the remote repo
* Clone the remote repo to set up a local copy of the code on every member's machine
* Plan out your organizational approach for the app requirements (making a Trello board if desired, etc.)

### Create a New Rails Application

Create a new rails app with postgres and rspec with the following steps:
- Create a empty directory with your app name
- Run this in the root of that directory: `rails new . --database=postgresql --skip-turbolinks --skip-test-unit -T` && `bundle`
- `rake db:create`
- Be sure you have the following gems in the Gemfile:

```ruby
gem 'foundation-rails'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl'
  gem 'valid_attribute'
  gem 'shoulda-matchers', require: false
end
```

- `bundle` the new added gems and install rspec `rails generate rspec:install`

Note: The `rails new` generated Gemfile has many commented lines/gems. You should clean up your Gemfile by deleting comments and any Ruby Gems which you are not using. You can always this file back via git or by creating a new Rails project.

### User Authentication

Very often, the first place we'll start when writing an app is the `User` model.  Most of our apps will require users to create accounts and login to access many of the key features.

#### Authentication Implementation

In Rails, we can use a gem called [Devise](https://github.com/plataformatec/devise) to create our `User` model for us.  It takes care of user authentication, security, forgotten passwords, and the like.  Devise is widely used and well-tested, so we shouldn't need to worry about the security of our users' data.

Get started adding devise by following the Devise guides [here](https://github.com/plataformatec/devise#getting-started).

#### Authentication User Stories

Your implementation should fulfill the following user stories, add the necessary acceptance tests to be sure functionality is always working properly:

```no-highlight
As a prospective user
I want to create an account
So that I can post items and review them
```

```no-highlight
As an unauthenticated user
I want to sign in
So that I can post items and review them
```

```no-highlight
As an authenticated user
I want to sign out
So that no one else can post items or reviews on my behalf
```

```no-highlight
As an authenticated user
I want to update my information
So that I can keep my profile up to date
```

```no-highlight
As an authenticated user
I want to delete my account
So that my information is no longer retained by the app
```

### CRUD Behavior

Now that we have users, it's time to add the item we want to review. We'll want to write user stories for each CRUD action that we want to complete for a review.

CRUD is an acronym representing the major database operations we might want to perform for a particular model.  It stands for:

* Create - A user adds an item to the database
* Read - A user views a list of items, or the page for a particular item
* Update - A user edits an item
* Delete - A user deletes an item

#### CRUD User Stories

In a standard CRUD app, each of these operations will correspond to a user story:

* Create

```no-highlight
As an authenticated user
I want to add an item
So that others can review it
```

* Read

```no-highlight
As an authenticated user
I want to view a list of items
So that I can pick items to review
```

```no-highlight
As an authenticated user
I want to view the details about an item
So that I can get more information about it
```

* Update

```no-highlight
As an authenticated user
I want to update an item's information
So that I can correct errors or provide new information
```

* Delete

```no-highlight
As an authenticated user
I want to delete an item
So that no one can review it
```

**Note:** You may decide that you want certain features (such as viewing a list of items) to be available to unauthenticated users, or non-users who visit the site.  In that case, you can modify user story to reflect that.

#### CRUD Implementation

Choose one pair in your group to complete the CRUD user stories for the item you want to review.

**Note:** While that pair is working, if the other pair is ready they can begin on the CRUD user stories for the `Review` model (see the next assignment).  Simply leave off the `item_id` and association with the `Item` model until the first group's Pull Request has been merged into master.  Then you can add in the foreign key and association between the two models.

#### Modify the User Stories

Tailor the user stories above to suit your app and add acceptance criteria to further guide your implementation.

Acceptance criteria should specify the following, at a minimum:

* What conditions must be met for the task to be completed.
  * Ex. "I must be logged in to add an item."
* Which fields are required.
  * Ex. "I must provide an item name and description."
* Which fields are optional.
  * Ex. "I may optionally provide the item's website."
* What happens in the case of an error.
  * Ex. "If I do not supply the required information, I receive an error message."
  * Ex. "If an item with that name is already in the database, I receive an error message."

#### Create a New Feature Branch

Create a new branch prefixed with your initials, for example:

```no-highlight
$ git branch hh-fs-add-<item_name>-model
```

#### Write an Acceptance Test

Before you begin your implementation for each user story, write an acceptance test for it.

#### Create a Pull Request

Push up your branch to GitHub and create a Pull Request.  Consult your EE project mentor for guidance on how to create a Pull Request.

### Continuous Delivery

While developing your review site, your team should practice [continuous delivery](https://en.wikipedia.org/wiki/Continuous_delivery). This means, that after a feature is complete, after the code has been reviewed by an EE and the test suite passes, the app should be deployed to production for the world to see.

The master branch of your project should be treated as a sacred place: A place where only reviewed and tested code shall live. If the team adheres to this mantra, and code branches are not prematurely merged into master, the master branch can be deployed to production at any time, with little worry of failure.

We will use Heroku as our production environment to serve our application to users. See the [Getting Started with Rails 4](https://devcenter.heroku.com/articles/getting-started-with-rails4) documentation on Heroku for instructions on getting your Rails app live on the Internets.

### Reviewing Items

While the first pair is working on adding your `Item` model, the second pair can start in on the CRUD user stories for reviews.

Using the examples in the last assignment, write user stories and acceptance criteria for reviews.

Your user stories should cover:

* A user adding a review
* A user viewing a list of reviews for an item
* A user updating a review
* A user deleting a review

Before writing any code for this feature, create a new branch in your repository. Then write an acceptance test for the review functionality before implementing it.

Once the feature is complete, open a pull request on GitHub to merge it back into master. Ensure that the pull request is reviewed by your mentor **before** it is merged into the master branch.

#### A Note on Dependencies

Obviously, you want your `Review` to be associated with a particular `Item` that is being reviewed.  However, your `Item` model may well not exist yet, since your other pair is probably working on it right now!

Because you don't have an `Item` model, you shouldn't add the `item_id` foreign key and association straightaway, because that would introduce broken code into your app:

```ruby
review = Review.first
review.item # this will break without an Item model
```

Instead, we can leave off our association and include an `item_name` field on our `reviews` table instead of an `item_id` foreign key.  Once the items Pull Request has been merged into master, you can update your acceptance tests, change the `item_name` column to a foreign key, and add the association.

Consult with your mentor for further guidance on this workflow.

### Voting

Now that we've got items and reviews, it's time to let users vote on reviews.

Write user stories and acceptance criteria to cover the following situations:

* A user votes on a review
* A user changes their vote
* A user deletes their vote

Make sure a user can only vote once per review.

**DO NOT USE** the `act_as_votable`, `thumbs_up`, `make_votable`, or any other gems to implement this feature. As before, start by checking out a new feature branch.  Write a controller test, make the test pass, and repeat until your user stories are complete.  Create a Pull Request containing your completed code.

### Administrators

Many web apps have separate admin sections that allow admins to perform tasks that regular users cannot. Let's give admins the ability to delete inappropriate items or reviews, or obnoxious users' accounts.

Write user stories and acceptance criteria to cover the following situations:

* An admin views a list of users
* An admin deletes a user
* An admin deletes an item
* An admin deletes a review

Follow the git and TDD workflow you've established when completing prior features.

#### Hints

There are two general approaches to implementing admin functionality: add conditional statements to existing views and controllers to check for admin privileges or define a separate set of views/controllers only accessible to admins.

Adding conditional checks for admins to existing views may look something like:

```html
<% @items.each do |item| %>
  <!-- some stuff here -->

  <% if current_user.admin? %>
    <%= button_to 'Delete', item, method: :delete %>
  <% end %>
<% end %>
```

Merely hiding a button or creating a separate view does not prevent malicious users from performing admin-only actions, such as triggering our `ItemsController#destroy` action. Malicious users could still delete records by sending hand-crafted HTTP requests to delete the record directly. Ensure that you have the appropriate checks in your controller to ensure that the authenticated user has the appropriate permissions to perform certain actions.

An alternative is to using **namespacing** to define a set of routes and controllers that are only accessible to admin users:

```ruby
namespace :admin do
  resources :items
end
```

With separate controllers and views you can simplify the authorization checks by only allowing admins to view any portion of the page.

**Note:** You should **not** use gems such as `cancan` or `rails_admin` to achieve this functionality.

### Profile Photos

Use the [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) gem to allow users to upload profile photos when they create or edit their accounts.  We'll use Carrierwave in combination with the [fog](https://github.com/fog/fog) gem to allow us to save profile photos on Amazon S3.

If you're feeling ambitious, you can also use Carrierwave to allow users to upload photos of whatever items your app reviews.

Because we already have user stories for creating and updating user profiles, you can simply modify those user stories to allow users to optionally provide a profile photo.

Try to follow the Carrierwave and fog documentation to implement this feature.  Learning to use a new gem by reading the docs is an important skill that you'll rely on frequently once you leave Launch.

#### Hints

One member of your group will need to create an Amazon AWS account and an S3 bucket to store the photos. S3 provides cheap storage and AWS offers free tier for new users of up to 1GB for a year but they require a credit card to sign up.  You'll then need to store your AWS credentials and S3 bucket name(s) as environment variables inside your app using the [dotenv-rails](https://github.com/bkeepers/dotenv) gem.

**Make sure not to commit these credentials!** If your credentials get pushed to GitHub and some nefarious person and/or bot gets ahold of them, they can rack up a nasty bill on your AWS account.

* The dotenv gem will have you store your credentials in a file called `.env`.  Make sure to add this to your `.gitignore` file before committing so that any changes you make to that file (e.g., adding your actual credentials) don't get committed and pushed to GitHub.
* Create a file called `.env.example` that contains the names of any environment variables a collaborator would need to set in order to use the app.

As an example, you should have the following in your `.gitignore`, `.env`, and `.env.example` files:

```no-highlight
# in /.gitignore:
/.env

# in /.env:
AWS_ACCESS_KEY_ID=<your actual AWS access key id>
AWS_SECRET_ACCESS_KEY=<your actual AWS secret access key>
S3_BUCKET=<the name of your S3 bucket>

# in /.env.example:
AWS_ACCESS_KEY_ID=
AWS_SECRET_ACCESS_KEY=
S3_BUCKET=
```

### Live-updating Items Index with React.js

Use your knowledge of React.js to create an index page for items which live-updates. Feature test this functionality with Jasmine/Enzyme.

### API Integration

Add an API integration that posts activity from your application to another
service on the web.

Write a user story and acceptance criteria for this feature. Suggested behavior
would be to have 'new' reviews post to a Twitter account you create for your
review site application.

Twitter developer docs are [here](https://dev.twitter.com/rest/public). If you
are stuck on how to get started with this, consult past material on how to
'consume' external APIs. You are not required to use the Twitter API and we encourage you to find an API that is useful for your app.

Be sure to tackle the challenge of how you will build tests for this (both unit
and acceptance level tests).

### Search

Add a search bar that allows users to search for items.

Write a user story and acceptance criteria for this feature.

Take some time to try to figure out how to do this on your own.

If you're stuck, consult past Sinatra apps that had search functionality, or [this Railscast](http://railscasts.com/episodes/37-simple-search-form) or [this blog article](http://www.stefanosioannou.com/rails-4-simple-search-form/).

### Email

Integrate email into your app using ActionMailer. Email the user who posted an item when someone posts a review of that item.  (Alternatively, or in addition, email reviewers when their reviews are up- or downvoted.)

Write a user story and acceptance criteria for this feature.

**NOTE:** When you deploy to Heroku, you'll need to set up an add-on to allow you to send email in production using ActionMailer.
