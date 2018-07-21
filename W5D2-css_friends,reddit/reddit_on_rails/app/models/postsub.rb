# == Schema Information
#
# Table name: postsubs
#
#  id         :bigint(8)        not null, primary key
#  sub_id     :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Postsub < ApplicationRecord
  belongs_to :sub
  belongs_to :post
end
