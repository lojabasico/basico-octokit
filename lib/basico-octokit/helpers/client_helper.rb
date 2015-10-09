module BasicoOctokit
  module Helpers
    module ClientHelper
      def client
        BasicoOctokit::Facade::Client.instance.get(configatron.basico_git_token)
      end

      def request_with_log(method, repo, params)
        puts "Calling [#{method}] from [#{repo}] with token #{configatron.basico_git_token} and params [#{params}] ".light_green
        response = client.send(method.to_sym,repo, params)
        puts "Received response : #{response.to_json}.".light_yellow
        response
      end
    end
  end
end
