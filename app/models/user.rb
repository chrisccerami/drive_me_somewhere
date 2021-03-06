class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :lift_requests
  has_many :lifts, through: :lift_requests
  has_one :driver

  validates :name, presence: true
  validates :phone, presence: true
end
