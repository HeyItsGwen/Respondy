#!/usr/bin/env ruby

require 'rubygems'
require 'chatterbot/dsl'

# Enabling **debug_mode** prevents the bot from actually sending tweets.
# no_update
verbose
# The blocklist is a list of users that your bot will never interact
blocklist "Udemy_Coupons1", "def"
# safelist "foo", "bar" (opposite of blocklist)
# Here's a list of words to exclude from searches. Use this list to
# add words which your bot should ignore for whatever reason.
exclude "hi", "spammer", "junk"
exclude bad_words

random_facts = ["Ruby, the programming language, was developed in the mid-1990's by Yukihiro 'Matz' Matsumoto in Japan! #Ruby #Facts", "Ruby, the programming language, was influenced by Perl, Smalltalk, Eiffel, Ada, Basic, and Lisp! #Ruby #Facts", "Ruby, the programming language, is dynamically typed and uses garbage collection! #Ruby #Facts", "Ruby, the programming language, supports multiple programming paradigms, including procedural, object-oriented, and functional programming! #Ruby #Facts", "Ruby, the programming language, was named in a chatroom before any code was ever written!", "Javascript is used so widely that all major web browsers have a dedicated engine to make it run!", "Javascript is a multi-paradigm language, supporting event-driven, functional, and imperative programming styles!", "Java and Javascript have nothing to do with each other!", "HTML was developed in 1993... It's 27 years old!!", "CSS was invented in 1996, 3 years after HTML! IT's 23 years old!"]

hashtag_array = ["#respondyb","#Respondyb","#respondyB","#RespondyB"]

start_time = DateTime.new(2019,12,29,0,0,0)
hash_time = DateTime.new(2019,12,19,0,0,0)

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

end
