FactoryGirl.define do
  factory :ticket_user,:class => BasicoOctokit::Models::TicketUser do |f|
    f.login { ["brexus","dudaeli","ismil","crisis"].sample }
    f.avatar_url "http://avatar.com/2.jpg"
    f.id {Random.rand(1...100)}
  end
end
