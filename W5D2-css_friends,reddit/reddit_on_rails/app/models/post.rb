# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string           not null
#  content    :text             not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  include Voteable
  validates :title, :url, :content, presence: true

  has_many :postsub

  has_many :subs,
    through: :postsub,
    source: :sub

  belongs_to :author,
  foreign_key: :user_id,
  class_name: :User

  has_many :comments

  def top_level_comments
    comments.where(parent_comment_id: nil)
  end

  def comments_by_parent_id
    hsh = Hash.new {|h,k| h[k]= []}
    comments.each do |comment|
      hsh[comment.parent_comment_id] << comment
    end
    hsh
  end


end
