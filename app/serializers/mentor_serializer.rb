class MentorSerializer < ActiveModel::Serializer
  attributes :id,
             :avatar,
             :name,
             :email,
             :phone,
             :slack,
             :location,
             :timezone_id,
             :bio,
             :expertise,
             :company,
             :position,
             :last_active,
             :first_name,
             :last_name

  def last_active
    object.last_active.strftime("%A %d %b %Y %l:%M %p")
  end

  def name
    first = object.first_name
    last = object.last_name
    "#{first} #{last}"
  end

end
