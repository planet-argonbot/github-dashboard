class Contributor
  include ClientHelper

  attr_reader :user, :repo

  def initialize(user, repo)
    @user = user
    @repo = repo
  end

  def last_contributed_at
    Date.parse(
      commits.first.commit.author.date
    )
  end

  private

  def commits
    Rails.cache.fetch("contributor:commits:#{user}:#{repo}", expires_in: 10.minutes) do
      client.commits(repo, 'master', { author: user })
    end
  end
end
