class User < ApplicationRecord
    has_secure_password

    has_many :recipes, dependent: :destroy

    # validates :username, presence:true, uniqueness: {case_sensitive: true}
    validates :username, presence: true, uniqueness: true

    

end
