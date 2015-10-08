module BasicoOctokit
  module SummaryApi
    class Issues

      ["opened","closed"].each do | value |
        define_singleton_method value do | date_start, date_end, repository, filter_by='created' |
          #get issues
          issues = BasicoOctokit::Facade::Issues.send value, repository
          #Filter date
          method = "#{filter_by}_at"
          begin
            issues.select! { |ticket| ticket.send(method) >= date_start && ticket.send(method) <= date_end }
          rescue NoMethodError
            raise BasicoOctokit::NoFilterException
          end

          BasicoOctokit::Models::Summary.new(
            date_start: date_start.to_date,
            date_end: date_end.to_date,
            state: value,
            repository: repository,
            total: issues.count,
            summary_labels:  self.build_summary_labels(issues),
            summary_users: self.build_summary_users(issues)
          )
        end
      end

      private

      # Agrupamento por ticket_label
      def self.build_summary_labels(tickets)
        tickets.inject(BasicoOctokit::SummaryApi::SummaryCollectionArray.new) do | summary_labels , ticket |
          ticket.ticket_labels.each do | ticket_label |
            ticket_label_found = summary_labels.find_by_label(ticket_label.name)
            if ticket_label_found.nil?
              summary_labels << BasicoOctokit::Models::SummaryLabel.new( :ticket_label => ticket_label, :total => 1 )
            else
              ticket_label_found.total += 1
            end
          end
          summary_labels
        end
      end

      # Agrupamento por ticket_label
      def self.build_summary_users(tickets)
        tickets.inject(BasicoOctokit::SummaryApi::SummaryCollectionArray.new) do | summary_users , ticket |
          ticket_user = ticket.ticket_user
          ticket_user_found = summary_users.find_by_login(ticket_user.login)
          if ticket_user_found.nil?
            summary_users << BasicoOctokit::Models::SummaryUser.new( :ticket_user => ticket_user, :total => 1 )
          else
            ticket_user_found.total += 1
          end
          summary_users
        end
      end
    end
  end
end
