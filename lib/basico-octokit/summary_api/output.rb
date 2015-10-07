module BasicoOctokit
  module SummaryApi
    class Output

      ["opened","closed"].each do | value |
        define_singleton_method value do | date_start, date_end, repository |
          #TODO
          issues = BasicoOctokit::Issues.send value, repository

          summary = BasicoOctokit::Models::Summary.new(
            date_start: date_start.to_date,
            date_end: date_end.to_date,
            state: value,
            repository: repository,
            total: issues.count
          )

          summary.summary_labels = issues.inject([]) do | label , ticket |
            if !ticket.ticket_labels.empty?
              if label.include? ticket.ticket_labels
                label.find { | e | e = ticket.ticket_labels }.total += 1
              else
                label << BasicoOctokit::Models::SummaryLabel.new(
                            :ticket_label => ticket.ticket_labels,
                            :total => 1
                          )
              end
            end
            label
          end
          summary
        end
      end
    end
  end
end
