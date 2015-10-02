module BasicoOctokit
  class Issues
    extend BasicoOctokit::Helpers::ClientHelper
    def self.get(owner_repo,total_per_page=false)
        self.client.issues owner_repo, :per_page => (total_per_page || 10)
    end

  end

end
