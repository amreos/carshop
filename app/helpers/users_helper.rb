module UsersHelper

def full_name
   @user.first_name + " " + @user.last_name
end
#end
def avatar_for(user, options = {size: 80})
   size = options[:size]
	if user.avatar?
		image_tag user.avatar.url(:thumb), width: size, class: 'avatar-image'
	else
		image_tag "no-image.jpg", width: size, class: 'avatar-image'
	end
  end
end
