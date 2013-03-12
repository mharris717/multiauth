class Identity < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id, :provider

  def expires_int=(i)
    if i
      self.expires_at = Time.at(i-60*60*5)
    else
      self.expires_at = nil
    end
  end

  class Refresh
    include HTTParty
    base_uri "accounts.google.com:443"

    def initialize(token)
      @token = token
    end

    def new_token
      h = {}
      h['client_id'] = "239433986899.apps.googleusercontent.com"
      h['client_secret'] = "dy5CKyIh-hq9FWV57dUghcBE"
      h['refresh_token'] = @token
      h['grant_type'] = 'refresh_token'
      res = self.class.post("/o/oauth2/token",:body => h)
      res.parsed_response["access_token"]
    end
  end

  def refresh_access_token!
    r = Refresh.new(refresh_token)
    self.access_token = r.new_token
    raise "bad token" unless self.access_token.present?
    save!
  end
end
