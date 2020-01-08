# frozen_string_literal: true

require '../bin/RespondyB.rb'
require 'spec_helper.rb'

# RSPEC does not work with the API/Framework in use for this project.
# When RSPEC runs, it tries to rerun the entire bot, from setting up authorization with twitter
# To asking you to click a link and open your browser

# The code below will never run, because when it runs a method, the Framework takes over.

# Unit testing for this should be done by removing all methods from the loop in RespondyB.rb
# And testing them with different inputs each time.

# Since this bot checks the twitter website every 30 seconds, and compares tweed ID info every time
# You can't reliably set up a test programatically.

# Testing should occur as follows:
# Make sure the bot is running
# To test the response function: 
#     Tweet at the bot, wait 30 seconds for a reply, check the console if it doesn't happen.
#     Tweet at the bot again, wait 30 seconds, make sure the response is different.
# To test the hashtag response function:
#     Tweet '#respondyb' (or any variation of capitalization), wait 30 seconds for a retweet,
#     Then check the console if that doesn't happen.
#     Then wait another 30 seconds to make sure it doesn't try to retweet the retweet.
# To test the random tweet function:
#     When the bot starts, it should output a random tweet.
#     After 12 hours it should output another. If you wish to test on a time less than 12 hours,
#     Change the second line of the function, where it says '>= 0.5' to a smaller number.
#     1 would 24 hours, 0.5 is 12 hours, 0.25 is 6 hours, etc.

=begin
RSpec.describe 'replyer' do
  it "should output that it's checking for replies to the console" do
    printed = capture_stdout do
      replyer
    end
    printed.should include?('check for replies since ')
  end
end
=end