#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

class Post
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, :type => String
  field :body, :type => text
  field :user_id, :type => integer
  field :file, :type => binary
  field :link_url, :type => text
  field :likes_count, :type => integer
  field :reshares_count, :type => integer
  field :public, :type => boolean
  field :comments_count, :type => integer
  
    

end
