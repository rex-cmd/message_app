class User < ApplicationRecord
    has_many :messages
    validates :name, presence: true, uniqueness: true, length:{minimum:3, maximum:30}
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true #allows validation for empty passwords    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length:{maximum:225}, format:{with: VALID_EMAIL_REGEX}, 
                                                            uniqueness:{case_sensitive:false}

    has_secure_password                                         
end
