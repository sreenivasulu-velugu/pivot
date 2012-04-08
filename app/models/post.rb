#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title
  field :content
  field :user_id, :type => Integer
  field :file, :type => Binary
  field :link_url
  field :likes_count, :type => Integer
  field :reshares_count, :type => Integer
  field :comments_count, :type => Integer
  
    

end
