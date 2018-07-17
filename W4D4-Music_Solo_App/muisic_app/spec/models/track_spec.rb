# == Schema Information
#
# Table name: tracks
#
#  id         :bigint(8)        not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :integer          not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  track_type :string
#

require 'rails_helper'

RSpec.describe Track, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
