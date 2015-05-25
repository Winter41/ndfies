class Track < ActiveRecord::Base
  belongs_to :album
  mount_uploader :mp3, Mp3Uploader

  validates :name, presence: true,
                   length: { maximum: 12 },
                   uniqueness: true
  validates :mp3, presence: true

end
