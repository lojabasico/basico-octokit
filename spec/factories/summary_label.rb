FactoryGirl.define do
  factory :summary_label,
        :class => BasicoOctokit::Models::SummaryLabel do |f|
    f.total 1
    f.ticket_label { FactoryGirl.build(:ticket_label) }
  end
end
