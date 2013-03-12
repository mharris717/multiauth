class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
         
  has_many :identities
  
  validates_presence_of :email


  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  
  def has_identity?(provider)
    identities.where(:provider => provider.to_s).count > 0
  end
  
  def self.find_for_putio_oauth(auth, signed_in_resource=nil)
    UserFind.get(auth, :current_user => signed_in_resource)
  end
  
  def self.find_for_dropbox_oauth(auth, signed_in_resource=nil)
    UserFind.get(auth, :current_user => signed_in_resource)
  end
  
  def self.find_for_evernote_oauth(auth, signed_in_resource=nil)
    UserFind.get(auth, :current_user => signed_in_resource)
  end

  def self.find_for_google_oauth2(auth, signed_in_resource=nil)
    UserFind.get(auth, :current_user => signed_in_resource)
  end

  def get_ident(provider)
    identities.select { |x| x.provider == provider.to_s }.first
  end
end

