module BasicoOctokit
  module Models
    class SummaryUser
      include Virtus::Model

      attribute :total,                 Integer
      attribute :ticket_user,           BasicoOctokit::Models::TicketUser

    end
  end
end
