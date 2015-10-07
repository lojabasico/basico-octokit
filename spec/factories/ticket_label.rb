FactoryGirl.define do
  factory :ticket_label,
        :class => BasicoOctokit::Models::TicketLabel do |f|
    f.url 'http://xpto.com'
    f.name { ["bug","duplicate","issue","critical"].sample } 
    f.color '159818'
  end
end
