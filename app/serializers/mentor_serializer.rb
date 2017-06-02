class MentorSerializer < ActiveModel::Serializer
  attributes :id,
             :active,
             :avatar,
             :bio,
             :company,
             :email,
             :expertise,
             :first_name,
             :gender,
             :last_active,
             :last_name,
             :location,
             :name,
             :phone,
             :position,
             :slack,
             :timezone_name

  def last_active
    object.updated_at.strftime("%A %d %b %Y %l:%M %p")
  end

  def name
    first = object.first_name
    last = object.last_name
    "#{first} #{last}"
  end

  def gender
    object[:gender]
  end
end
