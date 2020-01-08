# RespondyBot9000

* [About](#about)
* [How To Use](#how-to-use-respondybot9000)
* [How It Works](#how-it-works)
* [Technologies](#technologies)
* [About Me](#about-me)

## About

![screenshot image](https://github.com/HeyItsGwen/Respondy/blob/development/images/RespondyImg.png)

RespondyBot9000 is a twitter bot that tweets fun programming facts every 12 hours! It also responds to you when you mention it by name, and retweets you when you use it's name in a hashtag!

## How To Use RespondyBot9000

Using RespondyBot9000 is simple. It's twitter! 
If you want to read fun programming facts, simply find @RespondyB and read the timeline.
If you want to have a fun programming fact tweeted to you, mention @RespondyB in a tweet, and it will reply with a random fact about a multitude of programming languages.
If you'd like to have your tweet retweeted (don't abuse it!), use the hashtag #respondyb (with any capitalization) and that tweet will be retweeted as soon as RespondyBot9000 finds it!

If you'd like to set up the bot to run on your own account, download the repo, run:

```
ruby /bin/RespondyB.rb
```
From inside the root folder, and set up the authentication with your twitter account. To make the hashtag function work, you'll have to change this:
```
def hashtag_responder
  search '#respondyb' do |tweet|
    retweet(tweet.id) unless tweet.text.include?('RT @')
  end
end
```
In methods rb. The hashtag in quotes is what the bot is searching for!

## How It Works

Every 30 seconds, this bot will run 3 checks:
* If it's been mentioned,
* If it's been 12 hours and it's time to tweet,
* And if it's name has been used as a hashtag.

If any of those things have happened, it will happily tweet and retweet whatever it finds!

## Technologies

This bot was made using the Chatterbot for Twitter API wrapper in Ruby. Without it, I wouldn't have been able to achieve any account authorization without setting up a webserver to recieve oAuth callbacks. Thanks Chatterbot!

This bot was also made with help from Rubocop and Stylint, and was version controlled using github and git-flow.

## About Me

I'm a developer in training with Microverse, graduating around August 2020.

* [Github](https://github.com/HeyItsGwen)
* [Twitter](https://twitter.com/itsgwenhey)
* [Linkedin](https://www.linkedin.com/in/gwen-hey-642109191/)
