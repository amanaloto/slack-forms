class User < ActiveRecord::Base

  has_many :presentations
  has_many :evaluations


  def self.valid_users
    Hash[User.all.map{ |u| [u.name, u.id] }]
  end

end
