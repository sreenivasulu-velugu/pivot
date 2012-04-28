class FileComment
  include Mongoid::Document
  include Mongoid::Timestamps
  mount_uploader :doc_file , DocUploader
  field :file_name
  field :file_type
  field :relevance
  field :privacy
  field :link_url
  field :user_id, :type => Integer
  field :likes_count, :type => Integer
  embedded_in :post, :inverse_of => :file_comments

  #validates :relevance, :privacy, :presence => true

  # relations
  belongs_to :user
  
end
