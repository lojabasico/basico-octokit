require 'spec_helper'


describe BasicoOctokit::SummaryApi::Issues do

  let(:opened) {
      temp = []
      temp.push(FactoryGirl.build(:ticket,{:created_at => Date.today     ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "x" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "brexus"}) }))
      temp.push(FactoryGirl.build(:ticket,{:created_at => Date.today - 1 ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "b" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "dudaeli"}) }))
      temp.push(FactoryGirl.build(:ticket,{:created_at => Date.today - 2 ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "c" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "ismil"}) }))
      temp.push(FactoryGirl.build(:ticket,{:created_at => Date.today - 3 ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "d" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "crisis"}) }))
  }

  let(:closed) {
      temp = []
      temp.push(FactoryGirl.build(:ticket_closed,{:created_at => Date.today     ,:closed_at => Date.today ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "x" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "brexus"}) }))
      temp.push(FactoryGirl.build(:ticket_closed,{:created_at => Date.today - 1 ,:closed_at => Date.today - 1 ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "b" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "dudaeli"}) }))
      temp.push(FactoryGirl.build(:ticket_closed,{:created_at => Date.today - 2 ,:closed_at => Date.today - 1 ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "c" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "ismil"}) }))
      temp.push(FactoryGirl.build(:ticket_closed,{:created_at => Date.today - 3 ,:closed_at => Date.today - 2 ,:ticket_labels => [FactoryGirl.build(:ticket_label, { :name => "d" })],:ticket_user => FactoryGirl.build(:ticket_user,{:login => "crisis"}) }))
  }
  let(:repository) { 'lojabasico/tickets_ti' }

  context "#opened" do
    context "#created_at" do
      it "should return summary"  do

        configatron.basico_git_token = "xxxx"
        expect(BasicoOctokit::Facade::Issues).to receive(:opened).and_return(opened)
        summary = described_class.opened( Date.today - 1, Date.today, repository )

        expect(summary.date_start).to eq(Date.today - 1)
        expect(summary.date_end).to eq(Date.today)
        expect(summary.repository).to eq(repository)
        expect(summary.summary_labels.count).to eq(2)
        expect(summary.summary_labels.first.total).to eq(1)
        expect(summary.summary_users.count).to eq(2)

      end

      it "should filter by date" do
        configatron.basico_git_token = "xxxx"
        expect(BasicoOctokit::Facade::Issues).to receive(:opened).and_return(opened)
        summary = described_class.opened( Date.today - 2, Date.today, repository )
        expect(summary.total).to eq(3)
      end
    end

  end

  context "#closed" do
    context "#created_at" do
      it "should filter by date" do
        configatron.basico_git_token = "xxxx"
        expect(BasicoOctokit::Facade::Issues).to receive(:closed).and_return(closed)
        summary = described_class.closed( Date.today - 2, Date.today, repository )
        expect(summary.total).to eq(3)
      end
    end
    context "#closed_at" do
      it "should filter by date" do
        configatron.basico_git_token = "xxxx"
        expect(BasicoOctokit::Facade::Issues).to receive(:closed).and_return(closed)
        summary = described_class.closed( Date.today - 2, Date.today, repository, "closed" )
        expect(summary.total).to eq(4)
      end
    end
    context "#DartVader" do
      it "should filter by date" do
        configatron.basico_git_token = "xxxx"
        expect(BasicoOctokit::Facade::Issues).to receive(:closed).and_return(closed)
        expect{described_class.closed( Date.today - 2, Date.today, repository, "dartvader" )}.to raise_error BasicoOctokit::NoFilterException
      end
    end
  end
end
