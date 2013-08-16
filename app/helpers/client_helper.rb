module ClientHelper
  def client
    Octokit::Client.new(oauth_token: ENV['GITHUB_OAUTH_TOKEN'])
  end
end
