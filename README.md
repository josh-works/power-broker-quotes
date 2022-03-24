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

(I'm copying generously from ([https://github.com/josh-works/turing_sidekiq_tutorial/tree/eb5ef7eb34f8baefab9d763c469d9917c09c7d3f](https://github.com/josh-works/turing_sidekiq_tutorial/tree/eb5ef7eb34f8baefab9d763c469d9917c09c7d3f)))

Lets check that our root is set to `home#show` in `localhost`...

It works!

```
rails g mailer QuoteMailer
```

err, not liking this, gonna try to get the OG repo up and working locally then go from there. 

Only spent 30 min on this, so making good progress w/jobs. Making a big WIP commit...