module BasicoOctokit
  module Models
    class Summary
      include Virtus::Model

      attribute :date_start,        Date
      attribute :date_end,          Date
      attribute :total,             Float
      attribute :state,             String
      attribute :repository,        String
      attribute :summary_labels,    Array['BasicoOctokit::Models::SummaryLabel']
      attribute :summary_users,     Array['BasicoOctokit::Models::SummaryUser']

    end
  end
end
