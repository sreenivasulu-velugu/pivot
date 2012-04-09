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
  field :last_access_time, :type => Time
  # last_access_times just here for history, not used
  field :last_access_times, :type => Array, :default => []

  attr_accessible :provider, :uid, :name, :email, :role, :company_name, :last_access_time, :last_access_times
 
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

