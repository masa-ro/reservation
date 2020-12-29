class Login < ApplicationRecord
    validates :login_id, presence: true
    validates :password, presence: true
end
