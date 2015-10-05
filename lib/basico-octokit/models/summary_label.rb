module BasicoOctokit
  module Models
    class SummaryLabel
      include Virtus::Model

      attribute :total,             Integer
      attribute :ticket_label,      BasicoOctokit::Models::TicketLabel

    end
  end
end
