module BasicoOctokit
  module Helpers
    module ClientHelper
      def client
        BasicoOctokit::Client.instance.get(configatron.basico_git_token)
      end
    end
  end
end
