class Repository < Octokit::Repository
  include ClientHelper

  def top_contributors
    contributions.first(3)
  end

  private

  def contributions
    client.contribs(slug)
  end
end
