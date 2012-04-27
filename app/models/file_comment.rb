class FileComment
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :doc_file , DocUploader
  field :doc_relevance
  field :doc_privacy
  field :type
  field :faq_relevance
  field :faq_privacy

  field :link_url
  field :link_url_relevance
  field :link_url_privacy
  field :user_id, :type => Integer
  field :likes_count, :type => Integer
  embedded_in :post, :inverse_of => :file_comments

  validates :content, :presence => true, :length => {:maximum => 65535}

  # relations
  belongs_to :user
  
end
