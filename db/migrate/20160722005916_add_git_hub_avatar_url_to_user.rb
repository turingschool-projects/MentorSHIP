class AddGitHubAvatarUrlToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :github_avatar_url, :string
  end
end
