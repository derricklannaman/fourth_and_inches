# == Schema Information
#
# Table name: opponents
#
#  id         :integer          not null, primary key
#  program_id :integer
#  team_id    :integer
#  name       :string(255)
#  notes      :text
#  division   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  street     :string(255)
#  town       :string(255)
#  zip        :string(255)
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  state      :string(255)
#

require 'spec_helper'

describe Opponent do
  pending "add some examples to (or delete) #{__FILE__}"
end
