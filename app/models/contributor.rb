class Contributor
  include ClientHelper

  attr_reader :user, :repo

  def initialize(user, repo)
    @user = user
    @repo = repo
  end

  def last_contributed_at
    Date.parse(commits.first.commit.author.date)
  end

  def contributions_for_week
    commits.each_with_object(Array.new(7, 0)) do |commit, result|
      date = Date.parse(commit.commit.author.date)
      if date >= 1.week.ago.to_date
        result[date.cwday - 1] += 1
      end
    end
  end

  private

  def commits
    Rails.cache.fetch("contributor:commits:#{user}:#{repo}", expires_in: 1.hour) do
      client.commits(repo, 'master', author: user)
    end
  end
end
