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
#  username               :string(255)
#  user_type              :string(255)
#  program_id             :integer
#  provider               :string(255)
#  uid                    :string(255)
#  oauth_token            :string(255)
#  oauth_expires_at       :datetime
#  image                  :string(255)
#  hasActiveAccount       :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  include Authority::UserAbilities

  rolify

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:email]

  after_create :add_user_role, :create_dashboard, :create_account

  has_one :dashboard, dependent: :destroy

  belongs_to  :program
  has_one     :access_code, dependent: :destroy
  has_many    :teams
  has_many    :players
  # has_many    :players, :through => :teams
  has_one     :account
  has_many    :transactions

  # validates :username,
  #   :uniqueness => {
  #     :case_sensitive => false
  #   },
  #   :format => { ... } # etc.

  def get_parents_players
    Player.all.where('parent_id = :parent', :parent => self.id)
  end

  def get_programs_players
    Player.all.where('program_id = :program', program: self.program.id).order('last_name ASC')
  end

  def account_balance
    self.account.balance / 100
  end

  def formatted_fee
    program.fee / 100
  end

  def add_user_role
    add_role(self.user_type)
  end

  def create_dashboard
    Dashboard.create(user_id: self.id)
  end

  def create_account
    if user_type == 'parent_user'
      fee = self.program.fee
      Account.create(user_id: self.id, balance: fee)
    else
      return
    end
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
