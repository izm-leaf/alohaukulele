class Size < ActiveRecord::Base
  validates :size, presence: true

  has_many :favorites, dependent: :destroy
  has_many :ukuleles, dependent: :destroy
end
