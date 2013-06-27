module UserMod
  extend ActiveSupport::Concern

  included do
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :omniauthable
           
    has_many :identities
    
    validates_presence_of :email
  end

  def has_identity?(provider)
    identities.where(:provider => provider.to_s).count > 0
  end

  module ClassMethods
    def find_for_putio_oauth(auth, signed_in_resource=nil)
      UserFind.get(auth, :current_user => signed_in_resource)
    end
    
    def find_for_dropbox_oauth(auth, signed_in_resource=nil)
      UserFind.get(auth, :current_user => signed_in_resource)
    end
    
    def find_for_evernote_oauth(auth, signed_in_resource=nil)
      UserFind.get(auth, :current_user => signed_in_resource)
    end

    def find_for_google_oauth2(auth, signed_in_resource=nil)
      UserFind.get(auth, :current_user => signed_in_resource)
    end

    def find_for_fatsecret(auth, signed_in_resource=nil)
      UserFind.get(auth, :current_user => signed_in_resource)
    end
  end

  def get_ident(provider)
    identities.select { |x| x.provider == provider.to_s }.first
  end
end