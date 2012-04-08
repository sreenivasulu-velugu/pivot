#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

class Like 
  
  include Mongoid::Document
  include Mongoid::Timestamps
  field :positive, :type => boolean
  field :post_id, :type => integer
  field :author_id, :type => integer
   
end
