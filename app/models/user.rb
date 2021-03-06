class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :groups, dependent: :destroy
  has_many :projects, through: :groups
  has_many :chatmessages
  has_many :comments, dependent: :destroy

  def username
    return "@#{email.split('@')[0]}"
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
end
