class Repository < Octokit::Repository
  include ClientHelper

  def top_contributors
    contributions.first(3)
  end

  def contributions
    Rails.cache.fetch("repository:contributions:#{slug}", expires_in: 10.minutes) do
      client.contribs(slug)
    end
  end
end
