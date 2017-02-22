class GithubController < ApplicationController
  def github_start
    redirect_to "/auth/github"
  end
end
