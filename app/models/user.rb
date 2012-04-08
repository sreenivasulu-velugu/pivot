class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :provider, :type => String
  field :uid, :type => String
  field :name, :type => String
  field :email, :type => String
  field :role, :type => String
  field :company_name, :type => String
  field :last_access_time, :type => Time
  # last_access_times just here for history, not used
  field :last_access_times, :type => Array, :default => []

  attr_accessible :provider, :uid, :name, :email, :role, :company_name, :last_access_time, :last_access_times
 
  #relations
  has_many :posts

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end

