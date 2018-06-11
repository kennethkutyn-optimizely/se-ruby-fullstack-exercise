##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'IncomingPhoneNumber' do
  it "can update" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .incoming_phone_numbers('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address_requirements": "none",
          "address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "beta": false,
          "capabilities": {
              "mms": true,
              "sms": false,
              "voice": true
          },
          "date_created": "Thu, 30 Jul 2015 23:19:04 +0000",
          "date_updated": "Thu, 30 Jul 2015 23:19:04 +0000",
          "emergency_status": "Inactive",
          "emergency_address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "(808) 925-5327",
          "identity_sid": "RIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "origin": "origin",
          "phone_number": "+18089255327",
          "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_application_sid": "",
          "sms_fallback_method": "POST",
          "sms_fallback_url": "",
          "sms_method": "POST",
          "sms_url": "",
          "status_callback": "",
          "status_callback_method": "POST",
          "trunk_sid": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_application_sid": "",
          "voice_caller_id_lookup": false,
          "voice_fallback_method": "POST",
          "voice_fallback_url": null,
          "voice_method": "POST",
          "voice_url": null
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .incoming_phone_numbers('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').update()

    expect(actual).to_not eq(nil)
  end

  it "can fetch" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .incoming_phone_numbers('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address_requirements": "none",
          "address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "beta": false,
          "capabilities": {
              "mms": true,
              "sms": false,
              "voice": true
          },
          "date_created": "Thu, 30 Jul 2015 23:19:04 +0000",
          "date_updated": "Thu, 30 Jul 2015 23:19:04 +0000",
          "emergency_status": "Active",
          "emergency_address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "(808) 925-5327",
          "identity_sid": "RIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "origin": "origin",
          "phone_number": "+18089255327",
          "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_application_sid": "",
          "sms_fallback_method": "POST",
          "sms_fallback_url": "",
          "sms_method": "POST",
          "sms_url": "",
          "status_callback": "",
          "status_callback_method": "POST",
          "trunk_sid": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_application_sid": "",
          "voice_caller_id_lookup": false,
          "voice_fallback_method": "POST",
          "voice_fallback_url": null,
          "voice_method": "POST",
          "voice_url": null
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .incoming_phone_numbers('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').fetch()

    expect(actual).to_not eq(nil)
  end

  it "can delete" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .incoming_phone_numbers('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').delete()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'delete',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json',
    ))).to eq(true)
  end

  it "receives delete responses" do
    @holodeck.mock(Twilio::Response.new(
        204,
      nil,
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .incoming_phone_numbers('PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa').delete()

    expect(actual).to eq(true)
  end

  it "can read" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .incoming_phone_numbers.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json',
    ))).to eq(true)
  end

  it "receives read_full responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=0",
          "incoming_phone_numbers": [
              {
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "address_requirements": "none",
                  "address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "api_version": "2010-04-01",
                  "beta": null,
                  "capabilities": {
                      "mms": true,
                      "sms": false,
                      "voice": true
                  },
                  "date_created": "Thu, 30 Jul 2015 23:19:04 +0000",
                  "date_updated": "Thu, 30 Jul 2015 23:19:04 +0000",
                  "emergency_status": "Active",
                  "emergency_address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "friendly_name": "(808) 925-5327",
                  "identity_sid": "RIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "origin": "origin",
                  "phone_number": "+18089255327",
                  "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "sms_application_sid": "",
                  "sms_fallback_method": "POST",
                  "sms_fallback_url": "",
                  "sms_method": "POST",
                  "sms_url": "",
                  "status_callback": "",
                  "status_callback_method": "POST",
                  "trunk_sid": null,
                  "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
                  "voice_application_sid": "",
                  "voice_caller_id_lookup": false,
                  "voice_fallback_method": "POST",
                  "voice_fallback_url": null,
                  "voice_method": "POST",
                  "voice_url": null
              }
          ],
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=2",
          "next_page_uri": null,
          "num_pages": 3,
          "page": 0,
          "page_size": 1,
          "previous_page_uri": null,
          "start": 0,
          "total": 3,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .incoming_phone_numbers.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::Response.new(
        200,
      %q[
      {
          "end": 0,
          "first_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=0",
          "incoming_phone_numbers": [],
          "last_page_uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1&Page=2",
          "next_page_uri": null,
          "num_pages": 3,
          "page": 0,
          "page_size": 1,
          "previous_page_uri": null,
          "start": 0,
          "total": 3,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json?PageSize=1"
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .incoming_phone_numbers.list()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::Response.new(500, ''))

    expect {
      @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                       .incoming_phone_numbers.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://api.twilio.com/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers.json',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::Response.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "address_requirements": "none",
          "address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "api_version": "2010-04-01",
          "beta": false,
          "capabilities": {
              "mms": true,
              "sms": false,
              "voice": true
          },
          "date_created": "Thu, 30 Jul 2015 23:19:04 +0000",
          "date_updated": "Thu, 30 Jul 2015 23:19:04 +0000",
          "emergency_status": "Active",
          "emergency_address_sid": "ADaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "friendly_name": "(808) 925-5327",
          "identity_sid": "RIaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "origin": "origin",
          "phone_number": "+18089255327",
          "sid": "PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "sms_application_sid": "",
          "sms_fallback_method": "POST",
          "sms_fallback_url": "",
          "sms_method": "POST",
          "sms_url": "",
          "status_callback": "",
          "status_callback_method": "POST",
          "trunk_sid": null,
          "uri": "/2010-04-01/Accounts/ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/IncomingPhoneNumbers/PNaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa.json",
          "voice_application_sid": "",
          "voice_caller_id_lookup": false,
          "voice_fallback_method": "POST",
          "voice_fallback_url": null,
          "voice_method": "POST",
          "voice_url": null
      }
      ]
    ))

    actual = @client.api.v2010.accounts('ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa') \
                              .incoming_phone_numbers.create()

    expect(actual).to_not eq(nil)
  end
end