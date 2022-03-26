Similar to how I did in [my polyline practice repo](https://github.com/josh-works/polyline-practice) I'm speedrunning this. 



## 2022-03-26

Confirming what I did last time around. It _wasn't quite_ in a working state then, but it is now. So, doing a `git add` and `git commit`

Commit ed380b

Oh, but it's not getting enqued. If I bring back a `sleep` count, you can interact with the app and see the problem.

So, do this:

```diff
--- a/app/controllers/quotes_controller.rb
+++ b/app/controllers/quotes_controller.rb
@@ -3,7 +3,7 @@ def create
     logger.debug "about to call worker from QuotesController"
     # SendGifToUserWorker.new.perform(params[:mailers][:email], params[:mailers][:thought])

-    SendGifToUserJob.new.perform(params["quote_mailer"]["email"], params["quote_mailer"]["thought"])
+    SendGifToUserJob.perform_async(params["quote_mailer"]["email"], params["quote_mailer"]["thought"])
     flash[:message] = "You did it! Email sent to #{params["quote_mailer"]["email"]}"
     redirect_to "/sent"
   end
```

Now, if you're keeping an eye on your redis 'server', you'll see a bunch of `lpush` but not `lpop`:

```
// start redis (optionally in a background tab):
$ redis-server &

// run a `monitor running redis instance` program to look for lines containing magical strings:
$ redis-cli monitor | grep -E "(hset|lpush)"
```

Now fire off some jobs, and watch them piling up in that tab. More info here: [https://josh.works/sidekiq-and-background-jobs-in-rails-for-beginners#watching-redis](https://josh.works/sidekiq-and-background-jobs-in-rails-for-beginners#watching-redis)

How to get those jobs to drain... hm. Also, shouldn't I be able to see a live Redis dashboard somewhere?


## 2022-03-24

Pushed along a bit farther, I've now got this _basically_ working in a very naïve, local-only way.

To use `mailcatcher` (which I love), I had to deviate from `gem install mailcatcher` because of random `openssl` errors. I tried to get it working, then found [this](https://stackoverflow.com/questions/30818391/gem-eventmachine-fatal-error-openssl-ssl-h-file-not-found)

```
$ gem install mailcatcher -- --with-cflags="-Wno-error=implicit-function-declaration"
```

Phew, I've got a very basic version of this all working. Don't like it, but leaving it here for now.

### Useful links:

- https://stackoverflow.com/questions/30818391/gem-eventmachine-fatal-error-openssl-ssl-h-file-not-found
- https://github.com/sj26/mailcatcher/issues/193#issuecomment-416750901
- http://localhost:3000/rails/mailers/

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

...

Spent some time trying to get my clone of Turing's repo running locally:

[https://github.com/josh-works/turing_sidekiq_tutorial/tree/master](https://github.com/josh-works/turing_sidekiq_tutorial/tree/master), and was unsuccessful.

So, I'm going to replicate the general functionality in this Rails 7 app I just created. 

I am combing through the commits on the repo with `git log -p`, from `rails new` forward. 

So far, I'm going to take out _most_ (or all?) of the gems

