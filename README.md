Similar to how I did in [my polyline practice repo](https://github.com/josh-works/polyline-practice) I'm speedrunning this. 

## 2022-03-23

I pay close attention to timestamps. We're just a few minutes in, I just added (and this publically listed the beginning of) [https://josh.works/projects#power-broker-quotes](https://josh.works/projects#power-broker-quotes)

```
10026  rails _7.0.2_ new power-broker-quotes --database postgresql --css tailwind
10028  lr
10029  cd power-broker-quotes
10030  hub create
10031  heroku create -a 'power-broker-quotes'
10032  atom .
10033  ga .
```

lets pick up here: [https://josh.works/sidekiq-and-background-jobs-in-rails-for-beginners](https://josh.works/sidekiq-and-background-jobs-in-rails-for-beginners)

We'll do a gif-generator, aiming to reproduce this more-or-less exactly, but in Rails 7, and local. 

Going to take a 5 min break. I am 20 minutes into this laptop session, only a little bit of it spent on this app exactly. Feeling good.

To launch the app:

```
bin/dev
```

```
rails g scaffold User email:string
rails g controller Home show
```
set root to `home#show`

create the DB

```
rails db:setup
rails db:migrate
```