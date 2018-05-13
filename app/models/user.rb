class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    #validates :name, presence: true, uniqueness: true
    #has_secure_password
  

         # added this to validate users updates might need to remove
  #validates :username, presence: true
   has_many :posts
   has_many :comments

  #mount avatar uploader
         mount_uploader :avatar, AvatarUploader

    ROLES = %i[admin customer]

    def roles=(roles)
      roles = [*roles].map { |r| r.to_sym }
      self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
    end

    def roles
      ROLES.reject do |r|
        ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
      end
    end

    def has_role?(role)
      roles.include?(role)
    end
    
  end

    #extend FriendlyId
    #friendly_id :username, use: :slugged
  #end
