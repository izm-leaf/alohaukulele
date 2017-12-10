class Wood < ActiveRecord::Base
  has_many :fav_top_relationships, foreign_key: "top_wood_id", dependent: :destroy
  has_many :fav_body_relationships, foreign_key: "body_wood_id", dependent: :destroy
  has_many :uku_relationships, foreign_key: "wood_id", dependent: :destroy
end
