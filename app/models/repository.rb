class Repository < Octokit::Repository
  include ClientHelper

  def top_contributors
    contributors.first(3)
  end

  def contributors
    Rails.cache.fetch("repository:contributors:#{slug}", expires_in: 1.hour) do
      client.contribs(slug)
    end
  end
end
