class Book < ApplicationRecord
    # has_secure_password
    validates :name,:address,:contact_number,:age,:email, presence: true
    validates :contact_number,length: { in: 8..10 }
    belongs_to :user
end
