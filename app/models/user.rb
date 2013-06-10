class User < ActiveRecord::Base
  puts "including usermod in multiauth"
  include UserMod
end

