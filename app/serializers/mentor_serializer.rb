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
             :timezone_name,
             :favorite,
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

  def student_favorites
    object.student_mentors
  end
end
