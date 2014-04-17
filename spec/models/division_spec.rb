# == Schema Information
#
# Table name: divisions
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  age_group    :string(255)
#  program_id   :integer
#  created_at   :datetime
#  updated_at   :datetime
#  weight_class :string(255)
#

require 'spec_helper'

describe Division do
  pending "add some examples to (or delete) #{__FILE__}"
end
