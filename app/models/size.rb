class Size < ActiveRecord::Base
  validates :size, presence: true

  has_many :favorites
  has_many :ukulele
end
