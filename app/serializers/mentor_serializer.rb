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
             :favorite

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

  def favorite
    if current_user != nil
      student_mentor = StudentMentor.find_by(student_id: current_user.student.id, mentor_id: object.id)
      student_mentor != nil && student_mentor.favorite == true
    else
      false
    end
  end
end
