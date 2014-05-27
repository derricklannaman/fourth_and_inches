# == Schema Information
#
# Table name: schedules
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  entry_type  :string(255)
#  team_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#  opponent_id :integer
#

require 'spec_helper'

describe Schedule do
  pending "add some examples to (or delete) #{__FILE__}"
end
