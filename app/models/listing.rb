class Listing < ApplicationRecord
	include Filterable 
	include PgSearch
	pg_search_scope :search_by_country, :against => :country
	belongs_to :user
	has_many :reservations
	mount_uploaders :property, ImageUploader


	def self.search_country(query)
		where("country ILIKE :country", country: "%#{query}%").map do |record|
			record.country
		end
	end 

	self.per_page = 32
  
end

WillPaginate.per_page = 32