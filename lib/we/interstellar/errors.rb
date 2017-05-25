require 'we-interstellar'

module We
  module Interstellar
    class Errors < ::Faraday::Response::Middleware
      ClientErrorStatuses = 400...500
      ServerErrorStatuses = 500...600

      class ClientError < Faraday::Error::ClientError; end
      class ResourceNotFound < Faraday::Error::ResourceNotFound; end
      class ServerError < Faraday::Error::ClientError; end

      def on_complete(env)
        case env[:status]
        when 404
          raise ResourceNotFound, response_values(env)
        when ClientErrorStatuses
          raise ClientError, response_values(env)
        when ServerErrorStatuses
          raise ServerError, response_values(env)
        end
      end

      def response_values(env)
        {:status => env.status, :headers => env.response_headers, :body => env.body}
      end
    end
  end
end
