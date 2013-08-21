require 'spec_helper'

describe Contributor do
  describe '#last_contributed_at' do
    before do
      stub_request(:get, 'https://api.github.com/repos/octokit/octokit.rb/commits?author=pengwynn&per_page=35&sha=master').
        to_return(body: fixture('commits.json'), headers: { content_type: 'application/json' })
    end

    it "returns a contributor's last contribution date" do
      contributor = Contributor.new('pengwynn', 'octokit/octokit.rb')
      expect(contributor.last_contributed_at).to be_a(Date)
      expect(contributor.last_contributed_at).to eq(Date.parse('2013-08-21T02:00:55Z'))
    end
  end
end
