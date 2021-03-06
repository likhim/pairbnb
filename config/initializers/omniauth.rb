Rails.application.config.middleware.use OmniAuth::Builder do	
	provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET']
end

OmniAuth.config.on_failure = Proc.new { |env|
   OmniAuth::FailureEndpoint.new(env).redirect_to_failure
} 