# RespondyBot9000

* [About](#about)
* [How To Use](#how-to-use-respondybot9000)
* [How It Works](#how-it-works)
* [Testing Instructions](#testing-instructions)
* [Technologies](#technologies)
* [About Me](#about-me)

## About

![screenshot image](https://github.com/HeyItsGwen/Respondy/blob/development/images/RespondyImg.png)

RespondyBot9000 is a twitter bot that tweets fun programming facts every 12 hours! It also responds to you when you mention it by name, and retweets you when you use it's name in a hashtag!

## How To Use RespondyBot9000

Using RespondyBot9000 is simple. It's twitter! 
If you want to read fun programming facts, simply find your accounts timeline! (@RespondyB was used for testing)
If you want to have a fun programming fact tweeted to you, mention your account in a tweet, and it will reply with a random fact about a multitude of programming languages. (i.e: @RespondyB)
If you'd like to have your tweet retweeted (don't abuse it!), use the hashtag #respondyb (or whichever hashtag you set up the both with, with any capitalization) and that tweet will be retweeted as soon as RespondyBot9000 finds it! 

If you'd like to set up the bot to run on your own account, You'll first need to get your twitter account approved on https://developer.twitter.com/, and create an app by clicking "apps" (in the top right, or in the dropdown menu on the left), and then clicking create an app. You'll then need to fill out a form about what the app does, what you're using it for, and your reasons for creating it.

Once that's done, if it doesn't open your apps details automatically, find your app on the https://developer.twitter.com/, and click on details. From there you can click edit to change the apps icon, name, website, and other details.

Once you have it set up as you'd like to, click on "keys and tokens", and then run:

```
ruby /bin/RespondyB.rb
```
From inside the root folder of the bot, and set up the authentication with your twitter account. It will ask for you keys, from the "keys and tokens" menu, and ask you to follow a link to log into your account. Whichever account you log into will do the tweeting, so make sure its the account you want!

To make the hashtag function work with a different hashtag, you'll have to change this:
```
def hashtag_responder
  search '#respondyb' do |tweet|
    retweet(tweet.id) unless tweet.text.include?('RT @')
  end
end
```
In methods rb. The hashtag in single quotes is what the bot is searching for. Be aware though: If you change anything after 'unless', the bot will break after retweeting something, as it will try to retweet its own retweet!

## How It Works

Every 30 seconds (or whatever time you set), this bot will run 3 checks:
* If it's been mentioned, (@accountname)
* If it's been 12 hours and it's time to tweet,
* And if it's name has been used as a hashtag. (Or whatever hashtag you tell it to listen for)

If any of those things have happened, it will happily tweet and retweet whatever it finds!

## Testing Instructions

Unit testing for this should be done by removing all methods from the loop in RespondyB.rb
And testing them with different inputs each time.

With the way the API/Framework is set up, and since this bot checks the twitter website every 30 seconds, and compares tweet ID info every time
You can't easily set it up programatically, and doing so would take a lot more time and effort than actually testing each function yourself, as it's such a simple bot.

Testing should occur as follows:

Make sure the bot is running

To test the response function: 
    Tweet at the bot, wait 30 seconds for a reply, check the console if it doesn't happen.
    Tweet at the bot again, wait 30 seconds, make sure the response is different.
To test the hashtag response function:
    Tweet '#respondyb' (or any variation of capitalization), wait 30 seconds for a retweet,
    Then check the console if that doesn't happen.
    Then wait another 30 seconds to make sure it doesn't try to retweet the retweet.
To test the random tweet function:
    When the bot starts, it should output a random tweet.
    After 12 hours it should output another. If you wish to test on a time less than 12 hours,
    Change the second line of the function, where it says '>= 0.5' to a smaller number.
    1 would 24 hours, 0.5 is 12 hours, 0.25 is 6 hours, etc.

## Technologies

This bot was made using the Chatterbot for Twitter API wrapper in Ruby. Without it, I wouldn't have been able to achieve any account authorization without setting up a webserver to recieve oAuth callbacks. Thanks Chatterbot!

This bot was also made with help from Rubocop and Stylint, and was version controlled using github and git-flow.

## About Me

I'm a developer in training with Microverse, graduating around August 2020.

* [Github](https://github.com/HeyItsGwen)
* [Twitter](https://twitter.com/itsgwenhey)
* [Linkedin](https://www.linkedin.com/in/gwen-hey-642109191/)
