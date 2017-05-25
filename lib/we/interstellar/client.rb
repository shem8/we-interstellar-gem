module We
  module Interstellar
    class Client
      def initialize(connection)
        @connection = connection
        improve_connection
      end

      def get_memberships(uuid)
        response = connection.get("/memberships/#{uuid}")
        response.body['result']['memberships']
      end

      private

      attr_reader :connection

      def improve_connection
        connection.response :json, content_type: /\bjson$/
        connection.use We::Interstellar::Errors
      end
    end
  end
end
