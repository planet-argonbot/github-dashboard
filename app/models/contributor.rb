class Contributor
  include ClientHelper

  attr_reader :user, :repo

  def initialize(user, repo)
    @user = user
    @repo = repo
  end

  def last_contributed_at
    Date.parse(
      client.commits(repo, 'master', {author: user}).first.commit.author.date
    )
  end
end
