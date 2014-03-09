class User < ActiveRecord::Base

  include Authority::UserAbilities
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :dashboard
  has_many :teams
  has_many :players
  has_many :players, :through => :teams
end
