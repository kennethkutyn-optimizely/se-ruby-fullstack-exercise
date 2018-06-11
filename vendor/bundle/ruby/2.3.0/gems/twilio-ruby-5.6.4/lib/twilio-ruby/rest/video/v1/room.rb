##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Video < Domain
      class V1 < Version
        class RoomList < ListResource
          ##
          # Initialize the RoomList
          # @param [Version] version Version that contains the resource
          # @return [RoomList] RoomList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Rooms"
          end

          ##
          # Retrieve a single page of RoomInstance records from the API.
          # Request is executed immediately.
          # @param [Boolean] enable_turn The enable_turn
          # @param [room.RoomType] type The type
          # @param [String] unique_name The unique_name
          # @param [String] status_callback The status_callback
          # @param [String] status_callback_method The status_callback_method
          # @param [String] max_participants The max_participants
          # @param [Boolean] record_participants_on_connect The
          #   record_participants_on_connect
          # @param [room.VideoCodec] video_codecs The video_codecs
          # @param [String] media_region The media_region
          # @return [RoomInstance] Newly created RoomInstance
          def create(enable_turn: :unset, type: :unset, unique_name: :unset, status_callback: :unset, status_callback_method: :unset, max_participants: :unset, record_participants_on_connect: :unset, video_codecs: :unset, media_region: :unset)
            data = Twilio::Values.of({
                'EnableTurn' => enable_turn,
                'Type' => type,
                'UniqueName' => unique_name,
                'StatusCallback' => status_callback,
                'StatusCallbackMethod' => status_callback_method,
                'MaxParticipants' => max_participants,
                'RecordParticipantsOnConnect' => record_participants_on_connect,
                'VideoCodecs' => Twilio.serialize_list(video_codecs) { |e| e },
                'MediaRegion' => media_region,
            })

            payload = @version.create(
                'POST',
                @uri,
                data: data
            )

            RoomInstance.new(@version, payload, )
          end

          ##
          # Lists RoomInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [room.RoomStatus] status The status
          # @param [String] unique_name The unique_name
          # @param [Time] date_created_after The date_created_after
          # @param [Time] date_created_before The date_created_before
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(status: :unset, unique_name: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
            self.stream(
                status: status,
                unique_name: unique_name,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams RoomInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [room.RoomStatus] status The status
          # @param [String] unique_name The unique_name
          # @param [Time] date_created_after The date_created_after
          # @param [Time] date_created_before The date_created_before
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(status: :unset, unique_name: :unset, date_created_after: :unset, date_created_before: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                status: status,
                unique_name: unique_name,
                date_created_after: date_created_after,
                date_created_before: date_created_before,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields RoomInstance records from the API.
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
          # Retrieve a single page of RoomInstance records from the API.
          # Request is executed immediately.
          # @param [room.RoomStatus] status The status
          # @param [String] unique_name The unique_name
          # @param [Time] date_created_after The date_created_after
          # @param [Time] date_created_before The date_created_before
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of RoomInstance
          def page(status: :unset, unique_name: :unset, date_created_after: :unset, date_created_before: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'Status' => status,
                'UniqueName' => unique_name,
                'DateCreatedAfter' => Twilio.serialize_iso8601_datetime(date_created_after),
                'DateCreatedBefore' => Twilio.serialize_iso8601_datetime(date_created_before),
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            RoomPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of RoomInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of RoomInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            RoomPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Video.V1.RoomList>'
          end
        end

        class RoomPage < Page
          ##
          # Initialize the RoomPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [RoomPage] RoomPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of RoomInstance
          # @param [Hash] payload Payload response from the API
          # @return [RoomInstance] RoomInstance
          def get_instance(payload)
            RoomInstance.new(@version, payload, )
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Video.V1.RoomPage>'
          end
        end

        class RoomContext < InstanceContext
          ##
          # Initialize the RoomContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [RoomContext] RoomContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid, }
            @uri = "/Rooms/#{@solution[:sid]}"

            # Dependents
            @recordings = nil
            @participants = nil
          end

          ##
          # Fetch a RoomInstance
          # @return [RoomInstance] Fetched RoomInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            RoomInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Update the RoomInstance
          # @param [room.RoomStatus] status The status
          # @return [RoomInstance] Updated RoomInstance
          def update(status: nil)
            data = Twilio::Values.of({'Status' => status, })

            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )

            RoomInstance.new(@version, payload, sid: @solution[:sid], )
          end

          ##
          # Access the recordings
          # @return [RoomRecordingList]
          # @return [RoomRecordingContext] if sid was passed.
          def recordings(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return RoomRecordingContext.new(@version, @solution[:sid], sid, )
            end

            unless @recordings
              @recordings = RoomRecordingList.new(@version, room_sid: @solution[:sid], )
            end

            @recordings
          end

          ##
          # Access the participants
          # @return [ParticipantList]
          # @return [ParticipantContext] if sid was passed.
          def participants(sid=:unset)
            raise ArgumentError, 'sid cannot be nil' if sid.nil?

            if sid != :unset
              return ParticipantContext.new(@version, @solution[:sid], sid, )
            end

            unless @participants
              @participants = ParticipantList.new(@version, room_sid: @solution[:sid], )
            end

            @participants
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Video.V1.RoomContext #{context}>"
          end
        end

        class RoomInstance < InstanceResource
          ##
          # Initialize the RoomInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [RoomInstance] RoomInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'status' => payload['status'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'account_sid' => payload['account_sid'],
                'enable_turn' => payload['enable_turn'],
                'unique_name' => payload['unique_name'],
                'status_callback' => payload['status_callback'],
                'status_callback_method' => payload['status_callback_method'],
                'end_time' => Twilio.deserialize_iso8601_datetime(payload['end_time']),
                'duration' => payload['duration'] == nil ? payload['duration'] : payload['duration'].to_i,
                'type' => payload['type'],
                'max_participants' => payload['max_participants'].to_i,
                'record_participants_on_connect' => payload['record_participants_on_connect'],
                'video_codecs' => payload['video_codecs'],
                'media_region' => payload['media_region'],
                'url' => payload['url'],
                'links' => payload['links'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'], }
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [RoomContext] RoomContext for this RoomInstance
          def context
            unless @instance_context
              @instance_context = RoomContext.new(@version, @params['sid'], )
            end
            @instance_context
          end

          ##
          # @return [String] The sid
          def sid
            @properties['sid']
          end

          ##
          # @return [room.RoomStatus] The status
          def status
            @properties['status']
          end

          ##
          # @return [Time] The date_created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date_updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [Boolean] The enable_turn
          def enable_turn
            @properties['enable_turn']
          end

          ##
          # @return [String] The unique_name
          def unique_name
            @properties['unique_name']
          end

          ##
          # @return [String] The status_callback
          def status_callback
            @properties['status_callback']
          end

          ##
          # @return [String] The status_callback_method
          def status_callback_method
            @properties['status_callback_method']
          end

          ##
          # @return [Time] The end_time
          def end_time
            @properties['end_time']
          end

          ##
          # @return [String] The duration
          def duration
            @properties['duration']
          end

          ##
          # @return [room.RoomType] The type
          def type
            @properties['type']
          end

          ##
          # @return [String] The max_participants
          def max_participants
            @properties['max_participants']
          end

          ##
          # @return [Boolean] The record_participants_on_connect
          def record_participants_on_connect
            @properties['record_participants_on_connect']
          end

          ##
          # @return [room.VideoCodec] The video_codecs
          def video_codecs
            @properties['video_codecs']
          end

          ##
          # @return [String] The media_region
          def media_region
            @properties['media_region']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # @return [String] The links
          def links
            @properties['links']
          end

          ##
          # Fetch a RoomInstance
          # @return [RoomInstance] Fetched RoomInstance
          def fetch
            context.fetch
          end

          ##
          # Update the RoomInstance
          # @param [room.RoomStatus] status The status
          # @return [RoomInstance] Updated RoomInstance
          def update(status: nil)
            context.update(status: status, )
          end

          ##
          # Access the recordings
          # @return [recordings] recordings
          def recordings
            context.recordings
          end

          ##
          # Access the participants
          # @return [participants] participants
          def participants
            context.participants
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.RoomInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Video.V1.RoomInstance #{values}>"
          end
        end
      end
    end
  end
end