class User < ActiveRecord::Base
    
    def self.create_user!(arguments)
        session_token=SecureRandom.base64
        arguments[:session_token]=session_token
        User.create!(arguments)
    end
    
end
