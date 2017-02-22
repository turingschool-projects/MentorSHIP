class Timezone < ApplicationRecord
  validates :name, presence: true

  has_many :mentors
end
