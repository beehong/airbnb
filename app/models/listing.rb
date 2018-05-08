class Listing < ApplicationRecord
	include Filterable 
	include PgSearch
	pg_search_scope :search_by_country, :against => :state
	belongs_to :user
	has_many :reservations, :dependent => :destroy
	mount_uploaders :property, ImageUploader


	def self.search_country(query)
		where("state ILIKE :state", state: "%#{query}%").map do |record|
			record.state
		end
	end 

	self.per_page = 32
  
end

WillPaginate.per_page = 32