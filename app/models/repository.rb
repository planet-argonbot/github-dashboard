class Repository < Octokit::Repository
  def top_contributors
    contributors.first(3)
  end

  def contributors
    Rails.cache.fetch("repository:contributors:#{slug}", expires_in: 1.hour) do
      OCTOKIT_CLIENT.contribs(slug)
    end
  end
end
