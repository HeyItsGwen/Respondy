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

hashtag_array = ["#respondyb","#Respondyb","#respondyB","#RespondyB"]

start_time = DateTime.new(2019,12,29,0,0,0)

loop do
  
  replies do |tweet|
    reply "#USER# Did you know that #{random_facts[rand(random_facts.length)]}", tweet
  end

  if DateTime.now() - start_time >= 0.5
    tweet("Did you know that #{random_facts[rand(random_facts.length)]}")
    start_time = DateTime.now()
  end

  hashtag_array.each do |tag|
    search "#{tag}" do |tweet|
      retweet(tweet.id)
    end
  end

  sleep 60

end 
