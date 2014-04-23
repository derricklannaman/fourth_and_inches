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

require 'spec_helper'

describe AccessCode do
  pending "add some examples to (or delete) #{__FILE__}"
end
