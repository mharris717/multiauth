def get_backtrace
  raise 'foo'
rescue => exp
  return exp.backtrace
end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  
  def putio
    require 'pp'

    File.open("tmp/params.txt","w") do |f|
      PP.pp(request.env["omniauth.auth"],f)
    end
    @user = User.find_for_putio_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Putio") if is_navigational_format?
    else
      raise "no user"
    end
  end
  
  def dropbox
    require 'pp'

    File.open("tmp/params.txt","a") do |f|
      PP.pp(request.env["omniauth.auth"],f)
    end
    
    #raise request.env["omniauth.auth"].inspect
    #raise request.env["omniauth.auth"].extra.raw_info.email.to_s
    @user = User.find_for_dropbox_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Dropbox") if is_navigational_format?
    else
      raise "no user"
    end
  end
  
  def evernote
    require 'pp'

    File.open("tmp/params.txt","a") do |f|
      PP.pp(request.env["omniauth.auth"],f)
    end
    
    #raise request.env["omniauth.auth"].inspect
    #raise request.env["omniauth.auth"].extra.raw_info.email.to_s
    @user = User.find_for_evernote_oauth(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Evernote") if is_navigational_format?
    else
      raise "no user"
    end
  end

  def google_oauth2
    require 'pp'

    File.open("tmp/params.txt","a") do |f|
      PP.pp(request.env["omniauth.auth"],f)
    end
    
    #raise request.env["omniauth.auth"].inspect
    #raise request.env["omniauth.auth"].extra.raw_info.email.to_s
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
    else
      raise "no user"
    end
  end
end