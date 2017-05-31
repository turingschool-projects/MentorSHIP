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
             :last_name,
             :active,
             :gender,
             :timezone,
             :student_favorites

  def last_active
    object.updated_at.strftime("%A %d %b %Y %l:%M %p")
    # object.last_active.strftime("%A %d %b %Y %l:%M %p")
  end


  def name
    first = object.first_name
    last = object.last_name
    "#{first} #{last}"
  end
  def timezone
    object.timezone.name
  end

  def timezone
    object.timezone.name
  end

  def gender
    object[:gender]
  end

  def student_favorites
    # binding.pry
    object.student_mentors
    # object.student_mentors(student_id: current_user.student.id)
    # if object.student_mentors.include?(student_id: current_user.student.id, favorite: true)
    #   #then display with button saying is favorite
    # else
    #   #display button to add it as a favorite
    # end
  end
end
