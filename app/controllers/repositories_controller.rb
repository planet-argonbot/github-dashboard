class RepositoriesController < ApplicationController
  def index
    @repositories = Rails.cache.fetch('repositories', expires_in: 10.minutes) { client.repositories }
  end

  def show
    @repository = Repository.new(owner: params[:owner], name: params[:name])
  end
end
