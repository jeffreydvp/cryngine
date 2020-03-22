require "json"

module Cryngine
  class Server
    class Request
      getter message

      def initialize(@server : Server, @message : MSGP::Message, @address : Socket::Address)
        @responded = false
      end

      def socket_address
        @address
      end

      def address : String
        @address.to_s.split(':').first
      end

      def port : Int32
        @address.to_s.split(':').last.to_i
      end

      def send(message : Slice(UInt8))
        # unless @responded
        @responded = true if @server.send(message, @address)
        # end
      end

      def responded?
        @responded
      end

      # Sets the sender to be authorized
      def authorized!
        true
      end

      def authorized?
        true
      end
    end
  end
end