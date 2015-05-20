class Album < ActiveRecord::Base
  belongs_to :artist

  validates :name, presence: true
end
