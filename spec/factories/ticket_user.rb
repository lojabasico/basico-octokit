FactoryGirl.define do
  factory :ticket_user,:class => BasicoOctokit::Models::TicketUser do |f|
    f.login "loginFake"
    f.avatar_url "http://avatar.com/2.jpg"
    f.id 1
  end
end
