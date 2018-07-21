# == Schema Information
#
# Table name: votes
#
#  id            :bigint(8)        not null, primary key
#  value         :integer
#  voteable_type :string
#  voteable_id   :bigint(8)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Vote < ApplicationRecord
  validates :value, presence: true, inclusion: {in: [-1, 1]}

  belongs_to :voteable, polymorphic: true
end
