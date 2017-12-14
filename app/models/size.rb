class Size < ActiveRecord::Base
  validates :name, presence: true

  has_many :favorites, dependent: :destroy
  has_many :ukuleles, dependent: :destroy
end
