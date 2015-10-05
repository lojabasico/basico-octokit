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
      self.injection(issues)
    end

    def self.injection(issues)
      issues.inject([]) do |arr, issue|
        myissue = BasicoOctokit::Models::Ticket.new(issue)
        myissue.ticket_user = BasicoOctokit::Models::TicketUser.new(issue.user)
        issue.labels.each do |label|
          myissue.ticket_labels << BasicoOctokit::Models::TicketLabel.new(label)
        end
        arr << myissue
        arr
      end
    end

  end

end
