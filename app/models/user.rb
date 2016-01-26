class User < ActiveRecord::Base

  has_many :presentations
  has_many :evaluations
  has_many :forms


  def self.valid_users
    Hash[User.all.map{ |u| [u.name, u.id] }]
  end

end
