# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  long_url   :string
#  short_url  :string
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, presence: true, uniqueness: true 
  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 
  
  has_many :visits,
    primary_key: :id,
    foreign_key: :shortened_url_id, 
    class_name: :Visit 
    
  has_many :visitors,
    through: :visits, 
    source: :visitor
    
  def self.random_code 
    new_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: new_url)
      new_url = SecureRandom.urlsafe_base64
    end 
    new_url
  end 
  
  def self.create_shorturl(user, long_url)
    short_url = ShortenedUrl.random_code
    ShortenedUrl.new(long_url: long_url, short_url: short_url, user_id: user.id)
  end
  
  
end 
