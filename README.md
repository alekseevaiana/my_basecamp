# README

## To see the heroku website

go to https://basecamp-17.herokuapp.com

## Current website's features

- you can sign in, log in and sign out
- you can edit profile or destroy it (within users/edit page)
- you can create projects within your profile
- you can invite users to a project
- inside projects you can create discutions, attachments, and todo list
- you can use a chatroom inside a project

## This steps are necessary to get the application up and running.

1. install yarn, npm, sqlite3, ruby, rails
2. ruby version 2.6.6
3. to run a server  
   `rails server`  
   \*To stop the web server, hit Ctrl+C in the terminal window where it's running.
   Things you may want to cover:
4. for db migration: `rails db:migrate`

## Deployment instruction

**it happens on main branch**  
$ heroku login  
$ git add .  
$ git commit -am "make it better"  
$ git push heroku main  
$ heroku run rails db:migrate
