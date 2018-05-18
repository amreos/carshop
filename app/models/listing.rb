#app/models/listings.html.erb

class Listing < ActiveRecord::Base

	belongs_to :admin
	has_many :reviews
	validates :title, :presence => { :message => "cannot be blank ..."}
	validates :title, :length => {:in => 2..20, :message => "Title must be between two and twenty characters"}
  
	validates :description, :presence => { :message => "cannot be blank ..."}
	validates :description, :length => {:maximum => 2000, :message => "maximum length 2000
 	characters"} 

	validates :make, :presence => { :message => "cannot be blank ..."}
	validates :make, :length => {:in => 2..20, :message => "Make field must be between two and twenty characters"}

   	validates :mpg, :presence => { :message => "cannot be blank ..."}
	validates :mpg, :length => {:in => 2..9, :message => "MPG field must be between two and thirty
   	five characters"}


	#validates :img_url, :allow_blank => true, :format=> {:with => %r{\.(gif|jpg|png)$}i,:multiline => true, 
	#:message => "Image url: must be a URL for GIF, JPG or PNG images."}
	
	validates :price, :numericality => {:greater_than_or_equal_to => 0, 
	:allow_blank => true, :message => "must be a positive value"}

		 #extend FriendlyId
	     #friendly_id :title, use: :slugged
	#end	

	

    def title=(s)
    	super s.titleize
	end

	def make=(s)
    	super s.titleize
	end

	def model=(s)
    	super s.titleize
	end


	# a simple search which returns all objects whose title 
	# is the same as the value of a search_string
	def self.simple_search(search_string)
		self.where("title = ?", search_string)
	end

	# return all products that have the value of 'search_string' 
	# somewhere in their 'title' or 'price'
	def self.fuzzy_search(search_string)

	# if search_string is nil, assign an empty string to search_string
	title = "%" + search_string + "%"
	price = search_string 
	make = "%" + search_string + "%"
	mpg = search_string 

  	self.where("title LIKE ? OR price  = ? OR mpg  = ? OR  make LIKE ?", 	title, price, mpg, make)
	end
end
