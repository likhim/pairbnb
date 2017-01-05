class Listing < ActiveRecord::Base
include Filterable
  belongs_to :user
  has_many :reservations
  paginates_per 20
  mount_uploaders :avatars, AvatarUploader

  scope :price, -> (price) { where price: price }
  scope :max_guests, -> (max_guests) { where max_guests: max_guests}
  scope :starts_with, -> (title) { where("title like ?", "#{title}%")}
   
  
end