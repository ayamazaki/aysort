class Person < ApplicationRecord
	
before_save { self.email = email.downcase }
has_many :users
has_many :microposts, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 100 },
                    uniqueness: true
  has_secure_password
   validates :password, presence: true, length: { minimum: 5 }


# def feed
#     Micropost.where("person_id = ?", id)
# end

end
