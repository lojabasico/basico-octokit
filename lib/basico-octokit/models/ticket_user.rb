module BasicoOctokit
  module Models
    class TicketUser
      include Virtus::Model

      attribute :login,               String
      attribute :avatar_url,          String
      attribute :id,                  Integer

     end
  end
end
