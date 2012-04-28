
#require 'carrierwave/orm/mongoid'
class Post
  
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title
  field :content
  field :user_id, :type => Integer
  
  field :likes_count, :type => Integer
  field :reshares_count, :type => Integer
  field :comments_count, :type => Integer
  


  validates_presence_of :title
  embeds_many :comments
  embeds_many :file_comments
  referenced_in :user
   
   

end
