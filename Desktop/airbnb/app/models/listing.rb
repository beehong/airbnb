class Listing < ApplicationRecord
	belongs_to :user
	has_many :reservations
	mount_uploaders :property, ImageUploader



	self.per_page = 32
  
end

WillPaginate.per_page = 32