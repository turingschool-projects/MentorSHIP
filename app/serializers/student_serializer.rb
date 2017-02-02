class StudentSerializer < ActiveModel::Serializer
  attributes :id,
             :avatar, 
             :name, 
             :email, 
             :phone_number, 
             :slack_username, 
             :bio, 
             :last_active
end
