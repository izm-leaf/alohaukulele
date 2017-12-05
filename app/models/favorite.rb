class Favorite < ActiveRecord::Base
  belongs_to :size
  belongs_to :wood
end
