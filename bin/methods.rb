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