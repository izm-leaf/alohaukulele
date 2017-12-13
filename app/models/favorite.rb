class Favorite < ActiveRecord::Base
  validates :size_id, numericality: true
  validates :top_wood_id, numericality: true
  validates :body_wood_id, numericality: true

  belongs_to :user
  belongs_to :size

  belongs_to :top_wood, class_name: "Wood"
  belongs_to :body_wood, class_name: "Wood"
end
