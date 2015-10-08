module BasicoOctokit
  module SummaryApi
    class SummaryCollectionArray < Array
      def find_by_label(name)
        self.find { | summary_label | summary_label.ticket_label.name == name }
      end

      def find_by_login(login)
        self.find { | summary_user | summary_user.ticket_user.login == login}
      end
    end
  end
end
