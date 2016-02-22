class User < ActiveRecord::Base

  validates :uid, :username, :provider, presence: true
  validates :uid, :username, uniqueness: true

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"] )
    if !user.nil?
      # Spy found, continue on with your life
      return user
    elsif auth_hash["provider"] == "developer"
      # Create a new spy
      user            = User.new
      user.uid        = auth_hash["uid"]
      user.provider   = auth_hash["provider"]
      user.username   = auth_hash["info"]["username"]
      if !user.avatar_url.present?
        user.avatar_url = "blank.png"
      end
      if user.save
        return user
      else
        return nil
      end
    elsif auth_hash["provider"] == "twitter"
      user           = User.new
      user.uid        = auth_hash["uid"]
      user.provider   = auth_hash["provider"]
      user.username   = auth_hash["info"]["nickname"]
      if !user.avatar_url.present?
        user.avatar_url = "blank.png"
      end
      if user.save
        return user
      else
        return nil
      end
    end
  end

  def self.create_from_omniauth(auth_hash)
  # Create a user
  end
end
