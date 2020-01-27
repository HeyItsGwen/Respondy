To set this bot up for yourself, to run on your own server, you need to apply for a twitter dev account, which can take a lot of emails and time to set up. If you do that, just run 'RespondyB.rb' and give the bot the keys/etc that it asks for.

For more set up instructions see README.md

If you wish to test this with my already set up bot, let me know on slack and I'll start the server on my end.

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