##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class ApplicationList < ListResource
            ##
            # Initialize the ApplicationList
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The unique id of the Account that created this
            #   application.
            # @return [ApplicationList] ApplicationList
            def initialize(version, account_sid: nil)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid}
              @uri = "/Accounts/#{@solution[:account_sid]}/Applications.json"
            end

            ##
            # Retrieve a single page of ApplicationInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name A human readable description of the new
            #   application, maximum of 64 characters.
            # @param [String] api_version Requests to this application will start a new TwiML
            #   session with this API version.
            # @param [String] voice_url The URL Twilio will request when a phone number
            #   assigned to this application receives a call.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database (additional charges apply). Either `true` or `false`.
            # @param [String] sms_url The URL Twilio will request when a phone number assigned
            #   to this application receives an incoming SMS message.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_status_callback The URL that Twilio will `POST` to when a
            #   message is sent via the `/SMS/Messages` endpoint if you specify the `Sid` of
            #   this application on an outgoing SMS request.
            # @param [String] message_status_callback Twilio will make a `POST` request to
            #   this URL to pass status parameters (such as sent or failed) to your application
            #   if you use the `/Messages` endpoint to send the message and specify this
            #   application's `Sid` as the `ApplicationSid` on an outgoing SMS request.
            # @return [ApplicationInstance] Newly created ApplicationInstance
            def create(friendly_name: nil, api_version: :unset, voice_url: :unset, voice_method: :unset, voice_fallback_url: :unset, voice_fallback_method: :unset, status_callback: :unset, status_callback_method: :unset, voice_caller_id_lookup: :unset, sms_url: :unset, sms_method: :unset, sms_fallback_url: :unset, sms_fallback_method: :unset, sms_status_callback: :unset, message_status_callback: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'ApiVersion' => api_version,
                  'VoiceUrl' => voice_url,
                  'VoiceMethod' => voice_method,
                  'VoiceFallbackUrl' => voice_fallback_url,
                  'VoiceFallbackMethod' => voice_fallback_method,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
                  'VoiceCallerIdLookup' => voice_caller_id_lookup,
                  'SmsUrl' => sms_url,
                  'SmsMethod' => sms_method,
                  'SmsFallbackUrl' => sms_fallback_url,
                  'SmsFallbackMethod' => sms_fallback_method,
                  'SmsStatusCallback' => sms_status_callback,
                  'MessageStatusCallback' => message_status_callback,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              ApplicationInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Lists ApplicationInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] friendly_name Only return application resources with friendly
            #   names that match exactly with this name
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(friendly_name: :unset, limit: nil, page_size: nil)
              self.stream(friendly_name: friendly_name, limit: limit, page_size: page_size).entries
            end

            ##
            # Streams ApplicationInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] friendly_name Only return application resources with friendly
            #   names that match exactly with this name
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(friendly_name: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(friendly_name: friendly_name, page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields ApplicationInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of ApplicationInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name Only return application resources with friendly
            #   names that match exactly with this name
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of ApplicationInstance
            def page(friendly_name: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              ApplicationPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of ApplicationInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of ApplicationInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              ApplicationPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Api.V2010.ApplicationList>'
            end
          end

          class ApplicationPage < Page
            ##
            # Initialize the ApplicationPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [ApplicationPage] ApplicationPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of ApplicationInstance
            # @param [Hash] payload Payload response from the API
            # @return [ApplicationInstance] ApplicationInstance
            def get_instance(payload)
              ApplicationInstance.new(@version, payload, account_sid: @solution[:account_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Api.V2010.ApplicationPage>'
            end
          end

          class ApplicationContext < InstanceContext
            ##
            # Initialize the ApplicationContext
            # @param [Version] version Version that contains the resource
            # @param [String] account_sid The account_sid
            # @param [String] sid The application Sid that that uniquely identifies this
            #   resource
            # @return [ApplicationContext] ApplicationContext
            def initialize(version, account_sid, sid)
              super(version)

              # Path Solution
              @solution = {account_sid: account_sid, sid: sid, }
              @uri = "/Accounts/#{@solution[:account_sid]}/Applications/#{@solution[:sid]}.json"
            end

            ##
            # Deletes the ApplicationInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a ApplicationInstance
            # @return [ApplicationInstance] Fetched ApplicationInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              ApplicationInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Update the ApplicationInstance
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long.
            # @param [String] api_version Requests to this application will start a new TwiML
            #   session with this API version.
            # @param [String] voice_url The URL Twilio will request when a phone number
            #   assigned to this application receives a call.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database (additional charges apply). Either `true` or `false`.
            # @param [String] sms_url The URL Twilio will request when a phone number assigned
            #   to this application receives an incoming SMS message.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_status_callback The URL that Twilio will `POST` to when a
            #   message is sent via the `/SMS/Messages` endpoint if you specify the `Sid` of
            #   this application on an outgoing SMS request.
            # @param [String] message_status_callback Twilio will make a `POST` request to
            #   this URL to pass status parameters (such as sent or failed) to your application
            #   if you use the `/Messages` endpoint to send the message and specify this
            #   application's `Sid` as the `ApplicationSid` on an outgoing SMS request.
            # @return [ApplicationInstance] Updated ApplicationInstance
            def update(friendly_name: :unset, api_version: :unset, voice_url: :unset, voice_method: :unset, voice_fallback_url: :unset, voice_fallback_method: :unset, status_callback: :unset, status_callback_method: :unset, voice_caller_id_lookup: :unset, sms_url: :unset, sms_method: :unset, sms_fallback_url: :unset, sms_fallback_method: :unset, sms_status_callback: :unset, message_status_callback: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'ApiVersion' => api_version,
                  'VoiceUrl' => voice_url,
                  'VoiceMethod' => voice_method,
                  'VoiceFallbackUrl' => voice_fallback_url,
                  'VoiceFallbackMethod' => voice_fallback_method,
                  'StatusCallback' => status_callback,
                  'StatusCallbackMethod' => status_callback_method,
                  'VoiceCallerIdLookup' => voice_caller_id_lookup,
                  'SmsUrl' => sms_url,
                  'SmsMethod' => sms_method,
                  'SmsFallbackUrl' => sms_fallback_url,
                  'SmsFallbackMethod' => sms_fallback_method,
                  'SmsStatusCallback' => sms_status_callback,
                  'MessageStatusCallback' => message_status_callback,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              ApplicationInstance.new(
                  @version,
                  payload,
                  account_sid: @solution[:account_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Api.V2010.ApplicationContext #{context}>"
            end
          end

          class ApplicationInstance < InstanceResource
            ##
            # Initialize the ApplicationInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] account_sid The unique id of the Account that created this
            #   application.
            # @param [String] sid The application Sid that that uniquely identifies this
            #   resource
            # @return [ApplicationInstance] ApplicationInstance
            def initialize(version, payload, account_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'api_version' => payload['api_version'],
                  'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                  'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'message_status_callback' => payload['message_status_callback'],
                  'sid' => payload['sid'],
                  'sms_fallback_method' => payload['sms_fallback_method'],
                  'sms_fallback_url' => payload['sms_fallback_url'],
                  'sms_method' => payload['sms_method'],
                  'sms_status_callback' => payload['sms_status_callback'],
                  'sms_url' => payload['sms_url'],
                  'status_callback' => payload['status_callback'],
                  'status_callback_method' => payload['status_callback_method'],
                  'uri' => payload['uri'],
                  'voice_caller_id_lookup' => payload['voice_caller_id_lookup'],
                  'voice_fallback_method' => payload['voice_fallback_method'],
                  'voice_fallback_url' => payload['voice_fallback_url'],
                  'voice_method' => payload['voice_method'],
                  'voice_url' => payload['voice_url'],
              }

              # Context
              @instance_context = nil
              @params = {'account_sid' => account_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [ApplicationContext] ApplicationContext for this ApplicationInstance
            def context
              unless @instance_context
                @instance_context = ApplicationContext.new(@version, @params['account_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] A string that uniquely identifies this resource
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The API version to use
            def api_version
              @properties['api_version']
            end

            ##
            # @return [Time] Date this resource was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] Date this resource was last updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] Human readable description of this resource
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] URL to make requests to with status updates
            def message_status_callback
              @properties['message_status_callback']
            end

            ##
            # @return [String] A string that uniquely identifies this resource
            def sid
              @properties['sid']
            end

            ##
            # @return [String] HTTP method to use with sms_fallback_method
            def sms_fallback_method
              @properties['sms_fallback_method']
            end

            ##
            # @return [String] Fallback URL if there's an error parsing TwiML
            def sms_fallback_url
              @properties['sms_fallback_url']
            end

            ##
            # @return [String] HTTP method to use with sms_url
            def sms_method
              @properties['sms_method']
            end

            ##
            # @return [String] URL Twilio with request with status updates
            def sms_status_callback
              @properties['sms_status_callback']
            end

            ##
            # @return [String] URL Twilio will request when receiving an SMS
            def sms_url
              @properties['sms_url']
            end

            ##
            # @return [String] URL to hit with status updates
            def status_callback
              @properties['status_callback']
            end

            ##
            # @return [String] HTTP method to use with the status callback
            def status_callback_method
              @properties['status_callback_method']
            end

            ##
            # @return [String] URI for this resource
            def uri
              @properties['uri']
            end

            ##
            # @return [Boolean] True or False
            def voice_caller_id_lookup
              @properties['voice_caller_id_lookup']
            end

            ##
            # @return [String] HTTP method to use with the fallback url
            def voice_fallback_method
              @properties['voice_fallback_method']
            end

            ##
            # @return [String] Fallback URL
            def voice_fallback_url
              @properties['voice_fallback_url']
            end

            ##
            # @return [String] HTTP method to use with the URL
            def voice_method
              @properties['voice_method']
            end

            ##
            # @return [String] URL Twilio will make requests to when relieving a call
            def voice_url
              @properties['voice_url']
            end

            ##
            # Deletes the ApplicationInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a ApplicationInstance
            # @return [ApplicationInstance] Fetched ApplicationInstance
            def fetch
              context.fetch
            end

            ##
            # Update the ApplicationInstance
            # @param [String] friendly_name A human readable descriptive text for this
            #   resource, up to 64 characters long.
            # @param [String] api_version Requests to this application will start a new TwiML
            #   session with this API version.
            # @param [String] voice_url The URL Twilio will request when a phone number
            #   assigned to this application receives a call.
            # @param [String] voice_method The HTTP method Twilio will use when requesting the
            #   above `Url`. Either `GET` or `POST`.
            # @param [String] voice_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML requested by `Url`.
            # @param [String] voice_fallback_method The HTTP method Twilio will use when
            #   requesting the `VoiceFallbackUrl`. Either `GET` or `POST`.
            # @param [String] status_callback The URL that Twilio will request to pass status
            #   parameters (such as call ended) to your application.
            # @param [String] status_callback_method The HTTP method Twilio will use to make
            #   requests to the `StatusCallback` URL. Either `GET` or `POST`.
            # @param [Boolean] voice_caller_id_lookup Look up the caller's caller-ID name from
            #   the CNAM database (additional charges apply). Either `true` or `false`.
            # @param [String] sms_url The URL Twilio will request when a phone number assigned
            #   to this application receives an incoming SMS message.
            # @param [String] sms_method The HTTP method Twilio will use when making requests
            #   to the `SmsUrl`. Either `GET` or `POST`.
            # @param [String] sms_fallback_url The URL that Twilio will request if an error
            #   occurs retrieving or executing the TwiML from `SmsUrl`.
            # @param [String] sms_fallback_method The HTTP method Twilio will use when
            #   requesting the above URL. Either `GET` or `POST`.
            # @param [String] sms_status_callback The URL that Twilio will `POST` to when a
            #   message is sent via the `/SMS/Messages` endpoint if you specify the `Sid` of
            #   this application on an outgoing SMS request.
            # @param [String] message_status_callback Twilio will make a `POST` request to
            #   this URL to pass status parameters (such as sent or failed) to your application
            #   if you use the `/Messages` endpoint to send the message and specify this
            #   application's `Sid` as the `ApplicationSid` on an outgoing SMS request.
            # @return [ApplicationInstance] Updated ApplicationInstance
            def update(friendly_name: :unset, api_version: :unset, voice_url: :unset, voice_method: :unset, voice_fallback_url: :unset, voice_fallback_method: :unset, status_callback: :unset, status_callback_method: :unset, voice_caller_id_lookup: :unset, sms_url: :unset, sms_method: :unset, sms_fallback_url: :unset, sms_fallback_method: :unset, sms_status_callback: :unset, message_status_callback: :unset)
              context.update(
                  friendly_name: friendly_name,
                  api_version: api_version,
                  voice_url: voice_url,
                  voice_method: voice_method,
                  voice_fallback_url: voice_fallback_url,
                  voice_fallback_method: voice_fallback_method,
                  status_callback: status_callback,
                  status_callback_method: status_callback_method,
                  voice_caller_id_lookup: voice_caller_id_lookup,
                  sms_url: sms_url,
                  sms_method: sms_method,
                  sms_fallback_url: sms_fallback_url,
                  sms_fallback_method: sms_fallback_method,
                  sms_status_callback: sms_status_callback,
                  message_status_callback: message_status_callback,
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.ApplicationInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Api.V2010.ApplicationInstance #{values}>"
            end
          end
        end
      end
    end
  end
end