class Listing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations
  paginates_per 20
end
