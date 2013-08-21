class Repository < Octokit::Repository
  include ClientHelper

  def top_contributors
    client.contribs(slug).first(3)
  end
end
