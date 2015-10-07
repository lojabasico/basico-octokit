FactoryGirl.define do
  factory :ticket,:class => BasicoOctokit::Models::Ticket do |f|
    f.url "http://blalba.com"
    f.id 1
    f.number 1111111
    f.title "loren ipsum"
    f.state "open"
    f.created_at Date.today
    f.updated_at Date.today
    f.body "body fake"
    f.ticket_labels { FactoryGirl.build_list(:ticket_label,1)}
    f.ticket_user { FactoryGirl.build(:ticket_user)}
  end
end
