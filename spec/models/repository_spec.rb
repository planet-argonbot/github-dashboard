require 'spec_helper'

describe Repository do
  let(:repo) { Repository.new('octokit/octokit.rb') }

  before do
    stub_request(:get, 'https://api.github.com/repos/octokit/octokit.rb/contributors?anon=false').
      to_return(body: fixture('contributors.json'), headers: { content_type: 'application/json' })
  end

  describe '#top_contributors' do
    it "returns a repository's top 3 contributors" do
      expect(repo.top_contributors.count).to eq(3)
      expect(repo.top_contributors).to be_an(Array)
    end
  end

  describe '#contributors' do
    it "returns a repository's contributors" do
      expect(repo.top_contributors).to be_an(Array)
    end
  end
end
