#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'

# Enabling **debug_mode** prevents the bot from actually sending tweets.
# no_update

verbose
# The blocklist is a list of users that your bot will never interact
# blocklist "abc", "def"
# safelist "foo", "bar" (opposite of blocklist)

# Here's a list of words to exclude from searches. Use this list to
# add words which your bot should ignore for whatever reason.
exclude "hi", "spammer", "junk"

exclude bad_words



random_facts = ["Ruby, the programming language, was developed in the mid-1990's by Yukihiro 'Matz' Matsumoto in Japan! #Ruby #Facts", "Ruby, the programming language, was influenced by Perl, Smalltalk, Eiffel, Ada, Basic, and Lisp! #Ruby #Facts", "Ruby, the programming language, is dynamically typed and uses garbage collection! #Ruby #Facts", "Ruby, the programming language, supports multiple programming paradigms, including procedural, object-oriented, and functional programming! #Ruby #Facts"]

start_time = DateTime.new(2019,12,29,0,0,0)

loop do
  
  replies do |tweet|
    reply "#USER# Did you know that #{random_facts[rand(random_facts.length)]}", tweet
  end

  if DateTime.now() - start_time >= 0.5
    tweet("Did you know that #{random_facts[rand(random_facts.length)]}")
    start_time = DateTime.now()
  end

  sleep 30

end


# Searches: You can do all sorts of stuff with searches on Twitter.
# However, please note, interacting with users who don't follow your
# bot is very possibly:
#  - rude
#  - uncool
#  - likely to get your bot suspended
#
# Still here? Hopefully it's because you're going to do something cool
# with the data that doesn't bother other people. Hooray!
#
#search "chatterbot" do |tweet|
#  # here's the content of a tweet
#  puts tweets.text
#end

#
# this block responds to mentions of your bot
#
#replies do |tweet|
#  # Any time you put the #USER# token in a tweet, Chatterbot will
#  # replace it with the handle of the user you are interacting with
#  reply "Yes #USER#, you are very kind to say that!", tweet
#end

#
# this block handles incoming Direct Messages. if you want to do
# something with DMs, go for it!
# 
# direct_messages do |dm|
#  puts "DM received: #{dm.text}"
#  direct_message "HELLO, I GOT YOUR MESSAGE", dm.sender
# end

#
# Use this block to get tweets that appear on your bot's home timeline
# (ie, if you were visiting twitter.com) -- using this block might
# require a little extra work but can be very handy
#
# home_timeline do |tweet|
#  puts tweet.inspect
# end

#
# Use this block if you want to be notified about new followers of
# your bot. You might do this to follow the user back.
#
# NOTE: This block only works with the Streaming API. If you use it,
# chatterbot will assume you want to use streaming and will
# automatically activate it for you.
#
# followed do |user|
#  puts user.inspect
# end

#
# Use this block if you want to be notified when one of your tweets is
# favorited. The object passed in will be a Twitter::Streaming::Event
# @see http://www.rubydoc.info/gems/twitter/Twitter/Streaming/Event
#
# NOTE: This block only works with the Streaming API. If you use it,
# chatterbot will assume you want to use streaming and will
# automatically activate it for you.
#
# favorited do |event|
#  puts event.inspect
# end

#
# Use this block if you want to be notified of deleted tweets from
# your bots home timeline. The object passed in will be a
# Twitter::Streaming::DeletedTweet
# @see http://www.rubydoc.info/gems/twitter/Twitter/Streaming/DeletedTweet
#
# NOTE: This block only works with the Streaming API. If you use it,
# chatterbot will assume you want to use streaming and will
# automatically activate it for you.
#
#deleted do |tweet|
#
#end
  
