class User < ActiveRecord::Base
  authenticates_with_sorcery!
  
  has_many :jobs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 8}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

end
