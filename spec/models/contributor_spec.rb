require 'spec_helper'

describe Contributor do
  let(:contributor) { Contributor.new('pengwynn', 'octokit/octokit.rb') }

  before do
    stub_request(:get, 'https://api.github.com/repos/octokit/octokit.rb/commits?author=pengwynn&per_page=35&sha=master').
      to_return(body: fixture('commits.json'), headers: { content_type: 'application/json' })
  end

  describe '#last_contributed_at' do
    it "returns a contributor's last contribution date" do
      expect(contributor.last_contributed_at).to be_a(Date)
      expect(contributor.last_contributed_at).to eq(Date.parse('2013-08-21T02:00:55Z'))
    end
  end

  describe '#contributions_for_week' do
    before do
      Timecop.freeze(Time.utc(2013, 8, 21, 11, 20, 0))
    end

    after do
      Timecop.return
    end

    it "returns a contributor's contributions for the current week" do
      expect(contributor.contributions_for_week).to be_a(Array)
      expect(contributor.contributions_for_week.count).to eq(7)
      expect(contributor.contributions_for_week).to eq([1, 3, 8, 1, 0, 1, 0])
    end
  end
end
