FactoryGirl.define do
  factory :summary,:class => BasicoOctokit::Models::Summary do |f|
    f.date_start Date.today - 1
    f.date_end Date.today
    f.state 'opened'
    f.repository 'lojabasico/tickets_ti'
    f.total 10
    f.summary_labels nil
    f.summary_users nil
  end
end
