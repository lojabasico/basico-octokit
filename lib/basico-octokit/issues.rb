module BasicoOctokit
  class Issues
    extend BasicoOctokit::Helpers::ClientHelper

    {
      "opened" => :open,
      "closed" => :close
    }.each do | key, value|
      define_singleton_method key do | owner_repo|
        self.get owner_repo, value
      end
    end

    private

    def self.get(owner_repo,state)
      self.client.auto_paginate  = true
      issues = self.client.issues owner_repo, :state => state
      self.client.auto_paginate = false
      issues
    end

  end

end
