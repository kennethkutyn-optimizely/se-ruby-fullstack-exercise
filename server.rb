require 'sinatra'
require 'httparty'
require 'securerandom'
require 'twilio-ruby'
require 'optimizely'


# STEP 1: Add the Optimizely Full Stack Ruby gem
# STEP 2: Require the Optimizely gem 
# STEP 3: Include the twilio account SID, auth token and phone number below

# => Log into Twilio and access the account SID, token, and number
TWILIO_NUMBER = '+3197004498899'
TWILIO_ACCOUNT_SID = 
TWILIO_AUTH_TOKEN = 

# Optimizely Setup

# Step 4: Replace this url with your own Optimizely Project

DATAFILE_URI_ENCODED = URI("https://cdn.optimizely.com/public/7957466126/s/10827440452_10827440452.json")

# => Step 5: Use a library, such as HTTParty, to get grab the datafile from the CDN 
#         https://github.com/jnunemaker/httparty#examples
#         example: 
datafile = HTTParty.get(DATAFILE_URI_ENCODED).body
#         The above line will return the body of the http request 
#         NOTE: use the uri encoded url shown above :)

# => Step 6: Initialize the Optimizely SDK using the json retrieved from step 4
#		  https://developers.optimizely.com/x/solutions/sdks/reference/?language=ruby

optimizely_client = Optimizely::Project.new(datafile)
#optimizely_client = Optimizely::Project.new(datafile,Optimizely::EventDispatcher.new, Optimizely::SimpleLogger.new)

# => Initializing the Twilio client to send sms messages
# => https://www.twilio.com/docs/libraries/ruby
TWILIO_CLIENT = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

get '/' do
  puts "[CONSOLE LOG START]"
	'Welcome to the SE Full Stack training'

end

# => GET endpoint to receive messages, this should be setup as a webhook in Twilio
# => anytime twilio receives a message on our number, Twilio will make a request to this endpoint 
get '/sms' do
  
  # => Getting the number that texted the sms service
	sender_number = params[:From]

  # => Getting the message that was sent to the service
  # => We could use this to understand what the user said, and create a conversational dialog
	text_body = params[:Body]

  # => Outputing the number and text body to the ruby console
	puts "[CONSOLE LOG] New message from #{sender_number}"
	puts "[CONSOLE LOG] They said #{text_body}"
	puts "[CONSOLE LOG] Let's respond!"

	# =>  Randomly generate a new User ID to demonstrate bucketing
	user_id = SecureRandom.uuid

	# => STEP 7: Implement an Optimizely Full Stack experiment, or feature flag (with variables)
	# => Example, test out different messages in your response
	# => Using the helper function to reply to the number who messaged the sms service
  # => example: send_sms "Hey this is a response!" sender_number
  	
	#send_sms "you get variation 1", sender_number
  	enabled = optimizely_client.is_feature_enabled('newSMSresponse', user_id)
  	var1 = optimizely_client.get_feature_variable_integer('newSMSresponse', 'var1', user_id)

  	if var1 == 1
  		send_sms "Welcome to Optimizely Full Stack SMS Experiment. This is variation 1", sender_number
  	elsif var1 == 2
  		send_sms "Welcome to Optimizely Full Stack SMS Experiment. This is variation 2", sender_number
  	else
  		send_sms "you don't get a variation", sender_number
  	end
end

# => BONUS: Implement a Optimizely webhooks to receive updates when your datafile changes & reinitialize the SDK

# =>  Helper function to send a text message
# =>  The first parameter is the content of the text you wish to send
# =>  The second parameter is the number you wish to send the text to
def send_sms body, number
	TWILIO_CLIENT.api.account.messages.create(
      from: TWILIO_NUMBER,
      to: number,
      body: body
    ) 
end

