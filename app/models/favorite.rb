class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :size

  belongs_to :top_wood, class_name: "Wood"
  belongs_to :body_wood, class_name: "Wood"
end
