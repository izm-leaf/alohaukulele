class Ukulele < ActiveRecord::Base
  validates :model, presence: true
  validates :content, presence: true

  belongs_to :size
  belongs_to :wood

  mount_uploader :image, UkuleleUploader
end
