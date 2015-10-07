FactoryGirl.define do
  factory :summary_user,
        :class => BasicoOctokit::Models::SummaryUser do |f|
    f.total 1
    f.ticket_user { FactoryGirl.build(:ticket_user) }
  end
end
