class Artist < ActiveRecord::Base
  has_many :albums

  validates :name, presence: true,
                   length: { maximum: 12 },
                   uniqueness: true
end
