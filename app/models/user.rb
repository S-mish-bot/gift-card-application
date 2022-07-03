# email:string
# username:string
# password_digest: string
#
# password: string virtual
# password_confirmation: string virtual 


class User < ApplicationRecord
    has_secure_password
    # Has many relationships (plural)
    has_many :giftcoupons
    validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
    validates :username, presence: true, confirmation: true
end
 