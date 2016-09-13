class User < ApplicationRecord
  validates :name, presence: :true
  validates :email, presence: :true

  def self.from_omniauth(auth_info)
    where(email: auth_info.extra.raw_info.email).first_or_create do |new_user|
      new_user.name              = auth_info.extra.raw_info.name
      new_user.email             = auth_info.info.email
      new_user.github_url        = auth_info.extra.raw_info.html_url
      new_user.github_avatar_url = auth_info.extra.raw_info.avatar_url
      new_user.token             = auth_info.credentials.token
    end
  end
end
