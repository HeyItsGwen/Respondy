#!/usr/bin/env ruby
# frozen_string_literal: true

require 'rubygems'
require 'chatterbot/dsl'

verbose

blocklist 'RespondyB'

@random_facts = ["Ruby, the programming language, was developed in the mid-1990's by Yukihiro 'Matz' Matsumoto in Japan! #Ruby #Facts", 'Ruby, the programming language, was influenced by Perl, Smalltalk, Eiffel, Ada, Basic, and Lisp! #Ruby #Facts', 'Ruby, the programming language, is dynamically typed and uses garbage collection! #Ruby #Facts', 'Ruby, the programming language, supports multiple programming paradigms, including procedural, object-oriented, and functional programming! #Ruby #Facts', 'Ruby, the programming language, was named in a chatroom before any code was ever written!', 'Javascript is used so widely that all major web browsers have a dedicated engine to make it run!', 'Javascript is a multi-paradigm language, supporting event-driven, functional, and imperative programming styles!', 'Java and Javascript have nothing to do with each other!', "HTML was developed in 1993... It's 27 years old!!", "CSS was invented in 1996, 3 years after HTML! IT's 23 years old!"]

@start_time = DateTime.new(2019, 12, 29, 0, 0, 0)

def replyer
  replies do |tweet|
    reply "#USER# Did you know that #{@random_facts[rand(@random_facts.length)]}", tweet
  end
end

def tweeter
  if DateTime.now - @start_time >= 0.5
    tweet("Did you know that #{@random_facts[rand(@random_facts.length)]}")
    @start_time = DateTime.now
  end
end

def hashtag_responder
  search '#respondyb' do |tweet|
    retweet(tweet.id) unless tweet.text.include?('RT @')
  end
end

loop do
  replyer

  tweeter

  hashtag_responder

  sleep 30
end
