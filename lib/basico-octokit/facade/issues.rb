module BasicoOctokit
  module Facade
    class Issues
      extend BasicoOctokit::Helpers::ClientHelper

      {
        "opened" => :open,
        "closed" => :closed
      }.each do | key, value|
        define_singleton_method key do | owner_repo|
          self.build owner_repo, value
        end
      end

      private

      def self.build(owner_repo,state)
        issues = self.get owner_repo, state
        self.injection issues
      end

      def self.get(owner_repo,state)
        self.client.auto_paginate  = true
        #issues = self.client.issues owner_repo, :state => state
        issues = self.request_with_log :issues, owner_repo, :state => state
        self.client.auto_paginate = false
        issues
      end

      def self.injection(issues)
        arr = []
        issues.map { | issue |
          myissue = BasicoOctokit::Models::Ticket.new(issue)
          myissue.ticket_user = BasicoOctokit::Models::TicketUser.new(issue.user)
          issue.labels.each do |label|
            ticket_label = BasicoOctokit::Models::TicketLabel.new(label)
            myissue.ticket_labels << ticket_label
          end
          arr << myissue
        }
        arr
      end
    end
  end
end
