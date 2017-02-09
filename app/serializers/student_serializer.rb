class StudentSerializer < ActiveModel::Serializer
  attributes :id,
             :avatar,
             :name,
             :email,
             :phone_number,
             :slack_username,
             :bio,
             :cohort_name,
             :last_active

  def last_active
    object.last_active.strftime("%A %d %b %Y %l:%M %p")
  end

  def name
    first = object.first_name
    last = object.last_name
    "#{first} #{last}"
  end

end
