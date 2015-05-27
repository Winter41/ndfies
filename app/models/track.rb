class Track < ActiveRecord::Base
  belongs_to :album
  mount_uploader :file, FileUploader

  validates :name, presence: true,
                   length: { maximum: 12 }

end
