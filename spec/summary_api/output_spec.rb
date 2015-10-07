require 'spec_helper'


describe BasicoOctokit::SummaryApi::Output do

  let(:opened) { FactoryGirl.build_list(:ticket, 10)}
  let(:repository) { 'lojabasico/tickets_ti' }

  context "#opened" do
    it  do

      configatron.basico_git_token = "xxxx"
      expect(BasicoOctokit::Issues).to receive(:opened).and_return(opened)

      summary = described_class.opened( Date.today - 1, Date.today, repository )
      expect(summary.date_start).to eq(Date.today - 1)
      expect(summary.date_end).to eq(Date.today)
      expect(summary.repository).to eq(repository)
      expect(summary.total).to eq(10)
      expect(summary.summary_labels.count).to eq(0)

    end
  end

end
