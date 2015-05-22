class Album < ActiveRecord::Base
  # this is cool
  belongs_to :artist
  has_many :tracks

  validates :name, presence: true,
                   length: { maximum: 12 },
                   uniqueness: true
end
