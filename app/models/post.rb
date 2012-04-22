
#require 'carrierwave/orm/mongoid'
class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title
  field :content
  field :user_id, :type => Integer
  mount_uploader :doc_file , DocUploader
  field :doc_relevance
  field :doc_privacy
  mount_uploader :faq, FaqUploader
  field :faq_relevance
  field :faq_privacy

  field :link_url
  field :link_url_relevance
  field :link_url_privacy
  field :likes_count, :type => Integer
  field :reshares_count, :type => Integer
  field :comments_count, :type => Integer
  


  validates_presence_of :title
  embeds_many :comments
  referenced_in :user
   
   

end
