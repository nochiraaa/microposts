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
        presence: true,
        length:{maximum:200}
    
    validates :age,
        numericality: { 
                        only_integer: true, 
                        greater_than_or_equal_to: 0
                    }, 
        length: {
                minimum:1, 
                maximum:3
        }, 
        presence: true
    
    validates :hobby,
        presence: true,
        length: { maximum: 200 }
    
    has_secure_password
    has_many :microposts
end
