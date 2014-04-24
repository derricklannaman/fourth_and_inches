# == Schema Information
#
# Table name: access_codes
#
#  id          :integer          not null, primary key
#  access_code :string(255)
#  program_id  :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class AccessCode < ActiveRecord::Base
  belongs_to :program
  belongs_to :user

  before_create :generate_key

  def generate_key
    self.access_code = loop do
      random_key = rand(36**8).to_s(36)
      break random_key unless AccessCode.where(access_code: random_key).exists?
    end
  # binding.pry
  end

end
