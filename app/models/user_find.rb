class UserFind
  include FromHash
  attr_accessor :provider, :auth_obj
  
  def auth_obj_email
    res = auth_obj.extra.raw_info.email || auth_obj.extra.raw_info.mail
    raise "bad email #{res} #{auth_obj.inspect}" unless res.present? && res =~ /@/
    res
  end
  
  fattr(:existing_user) do
    User.where(:email => auth_obj_email).first
  end
  fattr(:created_user) do
    User.create! :email => auth_obj_email, :password => Devise.friendly_token[0,20]
  end
  fattr(:user) do
    existing_user || created_user
  end
  
  fattr(:existing_identity) do
    user.identities.where(:provider => provider).first
  end
  fattr(:created_identity) do
    raise "no token" unless auth_obj.credentials.token.present?

    user.identities.create! :provider => provider, 
    :access_token => auth_obj.credentials.token, :access_secret => auth_obj.credentials.secret,
    :refresh_token => auth_obj.credentials.refresh_token,
    :expires_int => auth_obj.credentials.expires_at
  end
  fattr(:identity) do
    if existing_identity
      existing_identity.access_token = auth_obj.credentials.token
      existing_identity.access_secret = auth_obj.credentials.secret
      existing_identity.refresh_token = auth_obj.credentials.refresh_token
      existing_identity.expires_int = auth_obj.credentials.expires_at
      existing_identity
    else
      created_identity
    end
  end
  
  def finished_user
    identity
    user
  end
  
  class << self
    def get(auth_obj,ops={})
      raise "no provider" unless auth_obj.provider.present?
      uf = new(:provider => auth_obj.provider, :auth_obj => auth_obj)
      uf.existing_user = ops[:current_user] if ops[:current_user]
      uf.finished_user
    end
  end
end

