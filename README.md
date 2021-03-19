# README

## Description
This is a project management tool created in Ruby on Rails. Users can register, create their own projects, invite other users to a project. In the scope of a project, users can add attachments, create discussions, make tasks, and chat!

## Link to the website

https://basecamp-17.herokuapp.com

## Current website's features

- you can sign in, log in and sign out
- you can edit profile or destroy it (within users/edit page)
- you can create, edit and destroy projects within your profile
- you can invite users to a project
- inside projects you can create, edit, destroy: discutions, attachments, todo list
- you can use a chatroom inside a project

## Installed instructions

1. install yarn, npm, sqlite3, ruby, rails
2. ruby version 2.6.6
3. to run a server: `rails server`
4. for db migration: `rails db:migrate`

## Deployment instruction

$ heroku login  
$ git add .  
$ git commit -am "make it better"  
$ git push heroku main  
$ heroku run rails db:migrate

We deploy it on the main branch
