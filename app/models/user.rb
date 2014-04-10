# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  is_head_coach          :boolean
#

class User < ActiveRecord::Base
  attr_accessor :login

  include Authority::UserAbilities

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:login]


  after_create :add_user_role, :create_dashboard


  has_one :dashboard, dependent: :destroy
  has_many :teams
  has_many :players
  has_many :players, :through => :teams

  # validates :username,
  #   :uniqueness => {
  #     :case_sensitive => false
  #   },
  #   :format => { ... } # etc.

  def add_user_role
    add_role(self.user_type)
  end

  def create_dashboard
    Dashboard.create(user_id: self.id)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

end
