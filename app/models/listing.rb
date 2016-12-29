class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  paginates_per 20
  mount_uploaders :avatars, AvatarUploader
end
