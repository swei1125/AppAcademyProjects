# == Schema Information
#
# Table name: albums
#
#  id         :bigint(8)        not null, primary key
#  band_id    :integer          not null
#  title      :string           not null
#  year       :integer          not null
#  alb_type   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Album, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
