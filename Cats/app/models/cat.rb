# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  COLOR = %w(yellow green black white brown orange)
  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: { in: COLOR,
    message: "%{value} is not a valid color"
  }

  has_many :cats_rental_requests,
  dependent: :destroy

  def self.color
      COLOR
  end
end
