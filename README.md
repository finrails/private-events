# Project: Private Events

## What's this

A project completed as part of [The Odin Ruby on Rails Learning Track](https://www.theodinproject.com/courses/ruby-on-rails/lessons/associations) to dive into ActiveRecord’s associations. The project involves building a private website with similar functionality to the well known event organization and management platform [Eventbrite](https://www.eventbrite.com/).

## Live Demo

You can try it out [here](https://sleepy-castle-22863.herokuapp.com/)  
**HEADS UP**: Heroku server may need up to 30 sec to fire up a dyno. Be patient! :)

## Screenshots

For those who are not patient, here are a couple of screenshots of what it looks like

<p float = 'left'>
  <img src="https://i.imgur.com/O8HJ9Pa.png" alt="Private events home page" width="700" height="auto">
  <img src="https://i.imgur.com/964U3CU.png" alt="Private events event card" width="700" height="auto">
  <img src="https://i.imgur.com/hFcsIi9.png" alt="Private events guest list" width="700" height="auto">
</p>

## Functionality

As far as this is a training app with focus on ActiveRecord's associations. After the registration/login they're able to create events, invite other users as well as to enroll for events organized by others. Nevertheless, the styling was not requested, I built a minimalistic design using `bootstrap` gem, a CSS framework.

## Getting started

To get started with the app, make sure you have Rails and Git installed on your machine  

<details>
  <summary>Get instructions</summary>

  Clone the repo to your local machine: 
  ```ruby
  $ git clone https://github.com/finrails/private-events.git
  ```
  Then, install the needed gems:
  ```ruby
  $ bundle install
  ```
  Next, migrate the database:
  ```ruby
  $ rails db:migrate
  ```
  Finally, on root path run a local server:
  ```ruby
  $ rails server
  ```
  Open browser to view application:
  ```ruby
  localhost:3000
  ```
</details>   

## Reflection

This was an awesome rundown practice and I had a really joyful fun playing with associations, until I bumped into extra credit on allowance to invite other users, but i did it, i really have created an invitation system that works well.

</details> 
