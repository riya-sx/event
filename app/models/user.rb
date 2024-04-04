class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  enum role: { user:0, admin: 1, moderator: 2}

  has_many :events, dependent: :destroy
  has_many :tickets, dependent: :destroy
end
