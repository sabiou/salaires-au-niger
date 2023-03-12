class Salary < ApplicationRecord
  validates :title, presence: true
  validates :city, presence: true
  validates :seniority, presence: true
  validates :salary, presence: true, numericality: {greater_than: 0}

  def self.ransackable_attributes(auth_object = nil)
    ["city", "company", "created_at", "id", "salary", "seniority", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
