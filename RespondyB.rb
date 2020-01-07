#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rubygems'
require 'chatterbot/dsl'
# rubocop: disable Metrics/LineLength
random_facts = ["Ruby, the programming language, was developed in the mid-1990's by Yukihiro 'Matz' Matsumoto in Japan! #Ruby #Facts #Programming", 'Ruby, the programming language, was influenced by Perl, Smalltalk, Eiffel, Ada, Basic, and Lisp! #Ruby #Facts #Programming', 'Ruby, the programming language, is dynamically typed and uses garbage collection! #Ruby #Facts #Programming', 'Ruby, the programming language, supports multiple programming paradigms, including procedural, object-oriented, and functional programming! #Ruby #Facts #Programming', 'Ruby, the programming language, was named in a chatroom before any code was ever written! #Ruby #Programming #Facts', 'Javascript is used so widely that all major web browsers have a dedicated engine to make it run! #Javascript', 'Javascript is a multi-paradigm language, supporting event-driven, functional, and imperative programming styles!', 'Java and Javascript have nothing to do with each other! #java #Javascript #JS', "HTML was developed in 1993... It's 27 years old!! #HTML #HTMLFacts", "CSS was invented in 1996, 3 years after HTML! IT's 23 years old! #CSSFacts #CSS"]
# rubocop: enable Metrics/LineLength
hashtag_array = ['#respondyb', '#Respondyb', '#respondyB', '#RespondyB']

start_time = DateTime.new(2019, 12, 29, 0, 0, 0)

loop do
  replies do |tweet|
    reply "#USER# Did you know that #{random_facts[rand(random_facts.length)]}", tweet
    puts 'Replied to a user who mentioned me'
  end

  if DateTime.now - start_time >= 0.5
    tweet("Did you know that #{random_facts[rand(random_facts.length)]}")
    start_time = DateTime.now
    puts 'Tweeted a fact at runtime, or on my 12 hour timer'
  end

  hashtag_array.each do |tag|
    search tag.to_s do |tweet|
      retweet(tweet.id)
      puts 'reTweeted someone who hashtagged me'
    end
  end

  sleep 60
end
