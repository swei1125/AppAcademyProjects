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

class Track < ApplicationRecord
  validates :album_id, :title, :ord, :track_type, presence: true

  belongs_to :album
  has_one :band

end
