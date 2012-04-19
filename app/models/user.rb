class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider
  field :uid
  field :name
  field :email
  field :role
  field :company_name
  field :image_url
  field :first_name
  field :following_list, :type => Array, :default => []
  field :follower_list, :type => Array, :default => []
  field :likes, :type => Array, :default => []
  field :last_access_time, :type => Time
  # last_access_times just here for history, not used
  field :last_access_times, :type => Array, :default => []

  attr_accessible :provider, :uid, :name, :email, :role,:follower_list,:following_list,
                  :company_name, :image_url, :last_access_time, :last_access_times,
                  :first_name, :likes
 
  #relations
  references_many :posts


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
         user.image_url = auth['info']['image'] || ""
      end
    end
  end

end

