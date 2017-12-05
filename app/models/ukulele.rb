class Ukulele < ActiveRecord::Base
  validates :model, presence: true
  validates :content, presence: true

  belongs_to :size
end
