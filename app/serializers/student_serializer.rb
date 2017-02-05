class StudentSerializer < ActiveModel::Serializer
  attributes :id,
             :avatar,
             :name,
             :email,
             :phone_number,
             :slack_username,
             :bio,
             :last_active

  def last_active
    object.last_active.strftime("%A %d %b %Y %l:%M %p")
  end

end
