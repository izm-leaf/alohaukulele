class Ukulele < ActiveRecord::Base
  validates :size_id, presence: true
  validates :wood_id, presence: true
  validates :model, presence: true
  validates :content, presence: true

  belongs_to :size
  belongs_to :wood

  has_many :comments, dependent: :destroy

  mount_uploader :image, UkuleleUploader
end
