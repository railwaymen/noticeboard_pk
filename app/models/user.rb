class User < ActiveRecord::Base
  devise :omniauthable
  validates :uid, :email, :name, presence: true
end
