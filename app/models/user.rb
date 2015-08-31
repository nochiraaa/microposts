class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name, 
        presence: true, 
        length: { maximum: 50 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, 
        presence: true,
        length:{maximum: 255},
        format: {with: VALID_EMAIL_REGEX},
        uniqueness: {case_sensitive: false }
    
    validates :profile,
        presence: true, on: :update,
        length:{maximum:200}
    
    validates :age,
        presence: true, on: :update,
        numericality: { 
                        only_integer: true, 
                        greater_than_or_equal_to: 0
                    }, 
        length: {
                maximum:3
        } 
        
    validates :hobby,
        presence: true, on: :update,
        length: {
            maximum: 200 
        }
    
    has_secure_password
    
end
