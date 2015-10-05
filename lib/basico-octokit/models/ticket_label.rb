module BasicoOctokit
  module Models
    class TicketLabel
      include Virtus::Model

      attribute :url,                 String
      attribute :name,                String
      attribute :color,               String

    end
  end
end
