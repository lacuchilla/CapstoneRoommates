Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer,
    :fields => [:username],
    :uid_field => :username

  provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
end
