# == Schema Information
#
# Table name: programs
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  league_name :string(255)
#  town_name   :string(255)
#  team_name   :string(255)
#

require 'spec_helper'

describe Program do
  pending "add some examples to (or delete) #{__FILE__}"
end
