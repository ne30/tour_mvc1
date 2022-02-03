class User < ApplicationRecord
    has_secure_password
    enum gender: [ :m, :f ]
    has_many :tickets
    validates :gender, presence: true
    validates :user_name, presence: true, uniqueness:true
end
