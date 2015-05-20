class Track < ActiveRecord::Base
  belongs_to :album

  validates :name, presence: true,
                   length: { maximum: 12 },
                   uniqueness: true

end
