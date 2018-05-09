# == Schema Information
#
# Table name: cats_rental_requests
#
#  id         :bigint(8)        not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CatsRentalRequest < ApplicationRecord
  STATUS = %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATUS,
    message: "Error, that is not a valid status!"
  }
  validate :overlapping_requests

  belongs_to :cat,
  foreign_key: :cat_id,
  class_name: :Cat

  def overlapping_requests
    collisions = CatsRentalRequest
    .select(:start_date, :end_date)
    .where("cat_id = :cat_id", {cat_id: cat_id})
    .where("start_date BETWEEN :start_date AND :end_date OR
    end_date between :start_date AND :end_date", {start_date: start_date,
      end_date: end_date})
    unless collisions.empty?
      self.errors[:errors] << "This request collides with an already approved request!"
    end
    collisions 
  end


end
