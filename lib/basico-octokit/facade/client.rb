module BasicoOctokit
  module Facade
    class Client
      include Singleton
      attr_accessor :client

      def initialize
        self.client = Octokit::Client.new
      end

      def get(access_token)
        self.client.access_token = access_token
        self.client
      end
    end

  end

end
