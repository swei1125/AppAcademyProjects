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

class Album < ApplicationRecord
  validates :band_id, :title, :year, :alb_type, presence: true
  validates :alb_type, inclusion: { in: %w(Live Studio),
    message: "%(value) is not a valid album type" }

  belongs_to :band
  has_many :tracks
end
