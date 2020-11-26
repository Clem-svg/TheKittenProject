class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :avatar

  after_create :welcome_send

  has_many :orders


  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end


  def to_param
    first_name
  end

end
