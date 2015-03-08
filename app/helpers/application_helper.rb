module ApplicationHelper
	def avatar_url(user)
		gravatar_id = Digest::MD5::hexdigest(user.downcase)
		"http://gravatar.com/avatar/#{gravatar_id}?d='http://5xr0qow57ecula29.zippykid.netdna-cdn.com/wp-content/uploads/2010/01/Visualbug-Facebook1.jpg'"
	end
	
end
