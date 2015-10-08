module BasicoOctokit
  module Models
    class Ticket
      include Virtus::Model

      attribute :url,           String
      attribute :id,            Integer
      attribute :number,        Integer
      attribute :title,         String
      attribute :state,         String
      attribute :created_at,    DateTime
      attribute :updated_at,    DateTime
      attribute :closed_at,     DateTime
      attribute :body,          String
      attribute :ticket_labels, Array[BasicoOctokit::Models::TicketLabel]
      attribute :ticket_user,   BasicoOctokit::Models::TicketUser

    end
  end
end
