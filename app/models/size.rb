class Size < ActiveRecord::Base
  validates :size, presence: true

  has_many :fav_relationships, foreign_key: "size_id", dependent: :destroy
  has_many :uku_relationships, foreign_key: "size_id", dependent: :destroy
end
