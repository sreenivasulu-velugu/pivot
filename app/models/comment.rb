
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content
  field :post_id, :type => integer
  field :user_id, :type => integer
  field :likes_count, :type => integer
  
  validates :content, :presence => true, :length => {:maximum => 65535}
   
  before_save do
    self.text.strip! unless self.text.nil?
  end

  after_save do
    self.post.touch
  end
    
 end
