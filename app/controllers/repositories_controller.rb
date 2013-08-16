class RepositoriesController < ApplicationController
  def index
    @repositories = client.repositories
  end

  def show
    @repository = Octokit::Repository.new(owner: params[:owner], name: params[:name])
  end
end
