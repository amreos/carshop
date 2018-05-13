#app/models/post.rb
class Post < ActiveRecord::Base
	belongs_to :user
	
	has_many :comments, dependent: :destroy

	 #mount avatar uploader
         mount_uploader :avatar, AvatarUploader

	#validates :title, presence: true, length: {minimum: 5}
	#validates :body,  presence: true

	 #This validates presence of title, and makes sure that the length is not more than 140 words
	 #validates :title, presence: true, length: {maximum: 180}
	 #This validates presence of body
	 #validates :body, presence: true

	 #extend FriendlyId
  	# friendly_id :title, use: :slugged
	#end
end
