class Timezone < ApplicationRecord
  validates :zone, presence: true
end
