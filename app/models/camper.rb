class Camper < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :camps
  validates :name, presence: true, length: { maximum: 50 }
end
