module Voteable
  extend ActiveSupport::Concern
  included do
    has_many :votes, as: :voteable
  end

  def vote_count
    count = 0
    votes.each do |v|
      count += v.value
    end
    count
  end
end
