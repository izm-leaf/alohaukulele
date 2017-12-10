class Wood < ActiveRecord::Base
  has_many :ukuleles, dependent: :destroy

  has_many :top_rel, foreign_key: "top_wood_id", class_name: "Favorite", dependent: :destroy
  has_many :body_rel, foreign_key: "body_wood_id", class_name: "Favorite", dependent: :destroy
  has_many :top_wood, through: :top_rel, source: :top_wood
  has_many :body_wood, through: :body_rel, source: :body_wood

end
