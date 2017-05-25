module We
  module Interstellar
    class Client
      def initialize(connection)
        @connection = connection
        improve_connection
      end

      def get_memberships(uuid)
        connection.get("/memberships/#{uuid}")
      end

      private

      attr_reader :connection

      def improve_connection
        connection.use We::Interstellar::Errors
      end
    end
  end
end
