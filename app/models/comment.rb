
class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :content
  field :user_id, :type => Integer
  field :likes_count, :type => Integer
  embedded_in :post, :inverse_of => :comments

  validates :content, :presence => true, :length => {:maximum => 65535}

  # relations
  belongs_to :user

  before_save do
    self.content.strip! unless self.content.nil?
  end

 # after_save do
  #  self.post.touch
 # end
    
 end
